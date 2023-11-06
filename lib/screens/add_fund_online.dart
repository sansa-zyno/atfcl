import 'dart:convert';
import 'dart:developer';
import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/constants/app_strings.dart';
import 'package:atfcl_fintech/controller/app_provider.dart';
import 'package:atfcl_fintech/helpers/style.dart';
import 'package:atfcl_fintech/modals/alert.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:atfcl_fintech/constants/api.dart';
import 'package:atfcl_fintech/services/http.service.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:get/get.dart' hide Response;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddFundOnline extends StatefulWidget {
  const AddFundOnline({Key? key}) : super(key: key);

  @override
  State<AddFundOnline> createState() => _AddFundOnlineState();
}

class _AddFundOnlineState extends State<AddFundOnline> {
  final plugin = PaystackPlugin();
  /* Map<String, dynamic> headers = {
    "Authorization": "Bearer $secretKey",
    "Content-Type": "application/json"
  };*/
  TextEditingController amtController = TextEditingController(text: '');
  int idx = -1;
  bool showAccts = false;
  String selectedAccountNo = "";
  String username = "";

  List myAccounts = [];

  Future getUsername() async {
    String username = await LocalStorage().getString("username");
    this.username = username;
    return username;
  }

  getMyAccounts(String username) async {
    Response res =
        await HttpService.post(Api.userAccounts, {"username": username});
    myAccounts = jsonDecode(res.data);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getUsername().then((value) => getUserData());
    plugin.initialize(publicKey: pubKey);
    getUsername().then((username) => getMyAccounts(username));
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: "Account To Fund",
                  color: appColor,
                  size: 16,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    showAccts = !showAccts;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        CustomText(
                          text: selectedAccountNo != ""
                              ? selectedAccountNo
                              : "Choose Account",
                          size: 16,
                          color:
                              selectedAccountNo == "" ? Colors.black45 : black,
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                    visible: showAccts,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: myAccounts.length,
                                itemBuilder: (ctx, index) => InkWell(
                                      onTap: () {
                                        idx = index;
                                        showAccts = false;
                                        selectedAccountNo =
                                            myAccounts[index]["AccountNumber"];
                                        setState(() {});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: idx == index
                                                ? appColor
                                                : Colors.transparent),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        child: Row(
                                          children: [
                                            Text(
                                                myAccounts[index]
                                                    ["AccountNumber"],
                                                style: TextStyle(
                                                    color: idx == index
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 16)),
                                          ],
                                        ),
                                      ),
                                    )),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Text("Amount",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF072A6C),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                CurvedTextField(
                  hint: "Enter amount",
                  controller: amtController,
                  type: TextInputType.number,
                ),
                SizedBox(
                  height: 50,
                ),
                GradientButton(
                  title: "Proceed",
                  clrs: [Color(0xFF072A6C), Color(0xFF072A6C)],
                  onpressed: () async {
                    String reference = Uuid().v4();
                    if (selectedAccountNo.isNotEmpty) {
                      if (amtController.text.isNotEmpty) {
                        if (appProvider.profileDetails != null) {
                          log(selectedAccountNo);
                          int amount = int.parse(amtController.text);
                          //initialize txn from backend(optional)
                          //*pass accesscode only when you have initialized txn from backend, else pass reference
                          //*accesscode is only required if method is checkout.bank or checkout.selectable(default)
                          //recommended to verify checkoutresponse result on your backend
                          try {
                            Charge charge = Charge()
                              ..amount = amount * 100
                              ..reference = reference
                              ..email = appProvider.profileDetails!["email"];
                            CheckoutResponse response = await plugin.checkout(
                                context,
                                method: CheckoutMethod.card,
                                charge: charge,
                                fullscreen: true);
                            Response result =
                                await HttpService.post(Api.fundAccount, {
                              "accountno": selectedAccountNo,
                              "txnid": response.reference,
                              "status":
                                  response.status ? "success" : "declined",
                              "amount": amount,
                              "date":
                                  "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                            });
                            Map res = jsonDecode(result.data);
                            if (res["Status"] == "succcess") {
                              log(res["Status"]);
                              log(username);
                              showDialog(
                                  context: context,
                                  builder: (ctx) => ShowDialogWidget(
                                        image: "assets/images/hand_up.png",
                                        titleText: res["Report"],
                                        subText: "",
                                      ));
                              appProvider.getAccountDetails(username);
                              appProvider.getTransactions(username);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => ShowDialogWidget(
                                        titleText: res["Report"],
                                        subText: "",
                                      ));
                            }
                          } on PlatformException catch (e) {
                            log(e.toString());
                          } catch (e) {
                            showDialog(
                                context: context,
                                builder: (ctx) => ShowDialogWidget(
                                      titleText: "Error",
                                      subText: "An Error occured",
                                    ));
                          }
                        } else {
                          showDialog(
                              context: context,
                              builder: (ctx) => ShowDialogWidget(
                                    titleText:
                                        "Your profile data is incomplete",
                                    subText:
                                        "Please upload your profile data and try again",
                                  ));
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (ctx) => ShowDialogWidget(
                                  titleText: "Amount cannot be empty",
                                  subText: "Please enter an amount to fund",
                                ));
                      }
                    } else {
                      showDialog(
                          context: context,
                          builder: (ctx) => ShowDialogWidget(
                                titleText: "Please select an account",
                                subText: "Account cannot be empty",
                              ));
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
