import 'dart:convert';
import 'dart:developer';

import 'package:atfcl_fintech/constants/api.dart';
import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/style.dart';
import 'package:atfcl_fintech/services/http.service.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  int idx = -1;
  bool showAccts = false;
  String selectedAccountNo = "";
  List myAccounts = [];
  String username = "";

  int accttypeIndex = -1;
  bool showAccountTypes = false;
  String selectedAccountType = "";
  String selectedAccountTypeValue = "";

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

  List accountTypes = [];

  getAccountTypes() async {
    Response res = await HttpService.get(Api.accountType);
    accountTypes = jsonDecode(res.data);
    setState(() {});
    log(accountTypes.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // appProvider = Provider.of(context, listen: false);
    //appProvider.getBanks();
    getUsername().then((username) => getMyAccounts(username));
    getAccountTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Create Account",
          weight: FontWeight.bold,
          size: 16,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            CustomText(
              text: "Send Account You Want To Pay From",
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
                      color: selectedAccountNo == "" ? Colors.black45 : black,
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
                                        Text(myAccounts[index]["AccountNumber"],
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
            CustomText(
              text: "Account Type",
              size: 16,
              color: appColor,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                showAccountTypes = !showAccountTypes;
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
                      text: selectedAccountType != ""
                          ? selectedAccountType
                          : "Choose Account Type",
                      size: 16,
                      color: selectedAccountType == "" ? Colors.black45 : black,
                    )
                  ],
                ),
              ),
            ),
            Visibility(
                visible: showAccountTypes,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: accountTypes.length,
                            itemBuilder: (ctx, index) => InkWell(
                                  onTap: () {
                                    accttypeIndex = index;
                                    showAccountTypes = false;
                                    selectedAccountType =
                                        accountTypes[index]["AccountName"];
                                    selectedAccountTypeValue =
                                        accountTypes[index]["id"];
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: accttypeIndex == index
                                            ? appColor
                                            : Colors.transparent),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 8),
                                    child: Row(
                                      children: [
                                        Text(accountTypes[index]["AccountName"],
                                            style: TextStyle(
                                                color: accttypeIndex == index
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
            CustomText(
              text: "Account Creation Fee",
              size: 16,
              color: appColor,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  CustomText(
                    text: "#2,000",
                    size: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color(0xff12246E),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Create Account",
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
