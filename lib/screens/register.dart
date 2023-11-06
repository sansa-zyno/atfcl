import 'dart:convert';
import 'dart:developer';
import 'package:atfcl_fintech/constants/api.dart';
import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/helpers/style.dart';
import 'package:atfcl_fintech/modals/alert.dart';
import 'package:atfcl_fintech/screens/bottom_navbar.dart';
import 'package:atfcl_fintech/screens/login.dart';
import 'package:atfcl_fintech/screens/change_password.dart';
import 'package:atfcl_fintech/screens/welcome.dart';
import 'package:atfcl_fintech/services/http.service.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:page_transition/page_transition.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading = false;
  bool obscurePass = true;
  bool obscurePass2 = true;
  int accttypeIndex = -1;
  int subAccountIndex = -1;
  bool showAccountTypes = false;
  bool showSub = false;
  bool showSubAccount = false;
  String selectedAccountType = "";
  String selectedAccountTypeValue = "";
  String selectedSubAccount = "";
  String selectedSubAccountValue = "";

  TextEditingController agentController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  List accountTypes = [];
  List subAccounts = [];

  getAccountTypes() async {
    Response res = await HttpService.get(Api.accountType);
    accountTypes = jsonDecode(res.data);
    setState(() {});
    log(accountTypes.toString());
  }

  getSubAccounts(String id) async {
    Response res = await HttpService.post(Api.subAccount, {"accountid": id});
    subAccounts = jsonDecode(res.data);
    showSub = true;
    log(subAccounts.toString());
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAccountTypes();
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
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                ),
                Spacer(),
                CustomText(
                  text: "Create an account",
                  size: 18,
                  weight: FontWeight.bold,
                ),
                Spacer()
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
                        text: "Agent Code(Optional)",
                        size: 16,
                        color: appColor,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CurvedTextField(
                        hint: "Agent Code(Optional)",
                        controller: agentController,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "First Name",
                        size: 16,
                        color: appColor,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CurvedTextField(
                        hint: "First Name",
                        controller: firstnameController,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "Last Name",
                        size: 16,
                        color: appColor,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CurvedTextField(
                        hint: "Last Name",
                        controller: lastnameController,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "Username",
                        size: 16,
                        color: appColor,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CurvedTextField(
                        hint: "Username",
                        controller: usernameController,
                      ),
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
                                color: selectedAccountType == ""
                                    ? Colors.black45
                                    : black,
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
                                                  accountTypes[index]
                                                      ["AccountName"];
                                              selectedAccountTypeValue =
                                                  accountTypes[index]["id"];
                                              setState(() {});

                                              getSubAccounts(
                                                  accountTypes[index]["id"]);
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
                                                  Text(
                                                      accountTypes[index]
                                                          ["AccountName"],
                                                      style: TextStyle(
                                                          color:
                                                              accttypeIndex ==
                                                                      index
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                          fontSize: 16)),
                                                ],
                                              ),
                                            ),
                                          )),
                                ),
                              ],
                            ),
                          )),
                      Visibility(
                        visible: showSub,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            CustomText(
                              text: "Select Sub Account",
                              size: 16,
                              color: appColor,
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            InkWell(
                              onTap: () {
                                showSubAccount = !showSubAccount;
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
                                      text:
                                          "${selectedSubAccount != "" ? selectedSubAccount : "Select Sub Account"}",
                                      size: 16,
                                      color: selectedSubAccount == ""
                                          ? Colors.black45
                                          : black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                                visible: showSubAccount,
                                child: Card(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: subAccounts.length,
                                            itemBuilder: (ctx, index) =>
                                                InkWell(
                                                  onTap: () {
                                                    subAccountIndex = index;
                                                    showSubAccount = false;
                                                    selectedSubAccount =
                                                        subAccounts[index]
                                                            ["SubaccountName"];
                                                    selectedSubAccountValue =
                                                        subAccounts[index]
                                                            ["id"];

                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: subAccountIndex ==
                                                                index
                                                            ? appColor
                                                            : Colors
                                                                .transparent),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15,
                                                            vertical: 8),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            subAccounts[index][
                                                                "SubaccountName"],
                                                            style: TextStyle(
                                                                color: subAccountIndex ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 16)),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "Email",
                        size: 16,
                        color: appColor,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CurvedTextField(
                        hint: "Email",
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "Phone Number",
                        size: 16,
                        color: appColor,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CurvedTextField(
                        hint: "Phone Number",
                        controller: phonenoController,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "Password",
                        size: 16,
                        color: appColor,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CurvedTextField(
                        hint: "Password",
                        obscureText: obscurePass,
                        controller: passwordController,
                        suffixIcon: IconButton(
                            onPressed: () {
                              obscurePass = !obscurePass;
                              setState(() {});
                            },
                            icon: !obscurePass
                                ? Icon(
                                    Icons.visibility_off,
                                    color: appColor,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: appColor,
                                  )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "Password Again",
                        size: 16,
                        color: appColor,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CurvedTextField(
                          hint: "Password Again",
                          obscureText: obscurePass2,
                          controller: password2Controller,
                          suffixIcon: IconButton(
                              onPressed: () {
                                obscurePass2 = !obscurePass2;
                                setState(() {});
                              },
                              icon: !obscurePass2
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: appColor,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: appColor,
                                    ))),
                      SizedBox(
                        height: 30,
                      ),
                      loading
                          ? Center(child: CircularProgressIndicator())
                          : InkWell(
                              onTap: () {
                                log(selectedAccountTypeValue);
                                log(selectedSubAccountValue);
                                signup();
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Color(0xff12246E),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: "Proceed",
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                children: [
                                  TextSpan(text: "Already have an account? "),
                                  TextSpan(
                                      style:
                                          TextStyle(color: Color(0xff921006)),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            changeScreen(context, Login()),
                                      text: "Log in")
                                ])),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  signup() async {
    loading = true;
    setState(() {});
    try {
      final apiResult = await HttpService.post(
        Api.register,
        {
          "username": usernameController.text,
          "agentid": agentController.text,
          "firstname": firstnameController.text,
          "lastname": lastnameController.text,
          "email": emailController.text,
          "phone": phonenoController.text,
          "accounttype": selectedAccountTypeValue,
          "subaccount": selectedSubAccountValue,
          "password": passwordController.text,
          "password2": password2Controller.text
        },
      );
      print(apiResult.data);
      //Map<String, String> result = apiResult.data as Map<String, String>;
      final result = jsonDecode(apiResult.data);
      print(result);
      if (result["Status"] == "success") {
        LocalStorage().setString("username", usernameController.text);
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
                child: Welcome(
                  username: usernameController.text,
                )),
            (route) => false);
      } else {
        showDialog(
            context: context,
            builder: (ctx) => ShowDialogWidget(
                  titleText: result["Report"],
                  subText: "Please check your sign up credentials",
                ));
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (ctx) => ShowDialogWidget(
                titleText: "Error",
                subText: "Please check your internet connection and try again",
              ));
    }
    loading = false;
    setState(() {});
  }
}
