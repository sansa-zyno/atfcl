/*import 'dart:convert';
import 'package:atfcl_fintech/constants/api.dart';
import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/style.dart';
import 'package:atfcl_fintech/services/http.service.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class SendToAccount extends StatefulWidget {
  const SendToAccount({Key? key}) : super(key: key);

  @override
  State<SendToAccount> createState() => _SendToAccountState();
}

class _SendToAccountState extends State<SendToAccount> {
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

  List myAccounts = [];

  Future getUsername() async {
    String username = await LocalStorage().getString("username");
    return username;
  }

  getMyAccounts(String username) async {
    Response res =
        await HttpService.post(Api.accountToFund, {"username": username});
    myAccounts = jsonDecode("[${res.data}]");
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: appColor2,
                    size: 20,
                  ),
                ),
                Spacer(),
                CustomText(
                  text: "Send To Bank Account",
                  size: 16,
                  weight: FontWeight.bold,
                ),
                Spacer(),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
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
                                              selectedAccountNo =
                                                  myAccounts[index]
                                                      ["Accountnumber"];
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
                                                          ["Accountnumber"],
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
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
                                        Response response =
                                            await HttpService.post(
                                                Api.sendToBank, {
                                          "sendfrom": selectedAccountNo,
                                          "accountnumberto":
                                              recipientAccountNo.text,
                                          "amount": amountController.text
                                        });
                                        Map res = jsonDecode(response.data);
                                        if (res["Status"] == "succcess") {
                                          Get.defaultDialog(
                                            title: "${res["Report"]}",
                                            titleStyle: TextStyle(
                                                color: Color(0xFF072A6C),
                                                fontWeight: FontWeight.bold),
                                            middleText:
                                                "Your transaction was done successfully",
                                            middleTextStyle: TextStyle(
                                                color: Color(0xFF072A6C)),
                                          );
                                        } else {
                                          Get.defaultDialog(
                                            title: "${res["Report"]}",
                                            titleStyle: TextStyle(
                                                color: Color(0xFF072A6C),
                                                fontWeight: FontWeight.bold),
                                            middleText:
                                                "Your transaction was not completed successfully",
                                            middleTextStyle: TextStyle(
                                                color: Color(0xFF072A6C)),
                                          );
                                        }
                                      } catch (e) {
                                        Get.defaultDialog(
                                          title: "Error",
                                          titleStyle: TextStyle(
                                              color: Color(0xFF072A6C),
                                              fontWeight: FontWeight.bold),
                                          middleText:
                                              "Please check your internet connection and try again",
                                          middleTextStyle: TextStyle(
                                              color: Color(0xFF072A6C)),
                                        ).then((value) => print("done"));
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
              ),
            )
          ],
        ),
      ),
    );
  }
}*/
