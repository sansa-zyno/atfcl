import 'dart:convert';
import 'package:atfcl_fintech/constants/api.dart';
import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/controller/app_provider.dart';
import 'package:atfcl_fintech/helpers/style.dart';
import 'package:atfcl_fintech/modals/alert.dart';
import 'package:atfcl_fintech/services/http.service.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:provider/provider.dart';

class SendToWallet extends StatefulWidget {
  const SendToWallet({Key? key}) : super(key: key);

  @override
  State<SendToWallet> createState() => _SendToWalletState();
}

class _SendToWalletState extends State<SendToWallet> {
  int idx = -1;
  bool showAccts = false;
  String selectedAccountNo = "";
  bool expanded = false;
  TextEditingController amountController = TextEditingController();
  TextEditingController narrationController = TextEditingController();
  TextEditingController recipientAccountNo = TextEditingController();
  bool loading = false;
  bool isloading = false;
  bool addToBeneficiary = false;
  bool confirmRecipient = false;
  String recipientName = "";
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
    // appProvider = Provider.of(context, listen: false);
    //appProvider.getBanks();
    getUsername().then((username) => getMyAccounts(username));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text: "Send From",
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
                            color: selectedAccountNo == ""
                                ? Colors.black45
                                : black,
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
                                          selectedAccountNo = myAccounts[index]
                                              ["AccountNumber"];
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
                    height: 15,
                  ),
                  CustomText(
                    text: "Recipient's Account Number",
                    color: appColor,
                    size: 16,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CurvedTextField(
                    hint: "",
                    controller: recipientAccountNo,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: "Confirm recipient’s name before tapping proceed",
                    size: 14,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: !confirmRecipient,
                    child: isloading
                        ? Center(child: CircularProgressIndicator())
                        : InkWell(
                            onTap: () async {
                              isloading = true;
                              setState(() {});
                              Response response = await HttpService.post(
                                Api.getBankDetailsOfAccountNo,
                                {"accountnumber": recipientAccountNo.text},
                              );

                              if (response.statusCode == 200) {
                                Map res = jsonDecode(response.data);
                                confirmRecipient = true;
                                recipientName = res["Full Name"];
                                isloading = false;
                                setState(() {});
                              } else {
                                isloading = false;
                                setState(() {});
                              }
                            },
                            child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: appColor2,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          blurRadius: 10,
                                          offset: Offset(2, 2))
                                    ]),
                                child: Center(
                                    child: CustomText(
                                  text: "Confirm Recipient",
                                  color: Colors.white,
                                ))),
                          ),
                  ),
                  Visibility(
                    visible: confirmRecipient,
                    child: Stack(
                      children: [
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ]),
                            child: CustomText(
                              text: recipientName,
                              size: 16,
                              color: appColor,
                              weight: FontWeight.bold,
                            )),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: InkWell(
                              onTap: () {
                                confirmRecipient = false;
                                recipientName = "";
                                setState(() {});
                              },
                              child: Icon(
                                Icons.close,
                                color: appColor2,
                              )),
                        )
                      ],
                    ),
                  ),
                  confirmRecipient
                      ? SizedBox(
                          height: 15,
                        )
                      : SizedBox(height: 50),
                  Visibility(
                    visible: confirmRecipient,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 283,
                          child: CustomText(
                            text: "Amount",
                            size: 16,
                            color: appColor,
                            weight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CurvedTextField(
                          hint: "",
                          controller: amountController,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        /*Container(
                          width: 283,
                          child: CustomText(
                            text: "Narration",
                            size: 16,
                            color: appColor,
                            weight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      CurvedTextField(
                        hint: "",
                        controller: narrationController,
                      ),*/
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(text: "Add to beneficiary list"),
                            Switch(
                                activeColor: Colors.white,
                                activeTrackColor: appColor,
                                value: addToBeneficiary,
                                onChanged: (x) {
                                  addToBeneficiary = x;
                                  setState(() {});
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  loading
                      ? Center(child: CircularProgressIndicator())
                      : GradientButton(
                          title: "Proceed",
                          textClr: Colors.white,
                          clrs: confirmRecipient
                              ? [appColor, appColor]
                              : [appColor, appColor],
                          onpressed: confirmRecipient
                              ? () async {
                                  try {
                                    loading = true;
                                    setState(() {});
                                    Response response = await HttpService.post(
                                        Api.sendToWallet, {
                                      "sendfrom": selectedAccountNo,
                                      "accountnumberto":
                                          recipientAccountNo.text,
                                      "amount": amountController.text
                                    });
                                    Map res = jsonDecode(response.data);
                                    if (res["Status"] == "succcess") {
                                      appProvider.getAccountDetails(username);
                                      appProvider.getTransactions(username);
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => ShowDialogWidget(
                                                image:
                                                    "assets/images/hand_up.png",
                                                titleText: res["Report"],
                                                subText:
                                                    "Your transaction was done successfully",
                                              ));
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => ShowDialogWidget(
                                                titleText: res["Report"],
                                                subText:
                                                    "The transaction was not completed",
                                              ));
                                    }
                                  } catch (e) {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => ShowDialogWidget(
                                              titleText: "Error",
                                              subText:
                                                  "Please check internet connection and try again",
                                            ));
                                  }
                                  loading = false;
                                  setState(() {});
                                }
                              : () {},
                        ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
