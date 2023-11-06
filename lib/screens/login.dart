import 'dart:convert';
import 'dart:developer';
import 'package:atfcl_fintech/constants/api.dart';
import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/modals/alert.dart';
import 'package:atfcl_fintech/screens/bottom_navbar.dart';
import 'package:atfcl_fintech/screens/forgot_password.dart';
import 'package:atfcl_fintech/screens/register.dart';
import 'package:atfcl_fintech/services/http.service.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  bool obscurePass = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Image.asset(
                "assets/images/assurancelogonobg.png",
                width: 250,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Sign In",
                      size: 18,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: "Welcome back!",
                      size: 16,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      text: "Username",
                      color: appColor,
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CurvedTextField(
                      hint: "Username",
                      controller: usernameController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      text: "Password",
                      color: appColor,
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CurvedTextField(
                        hint: "Enter password",
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
                                  ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                fillColor: MaterialStateProperty.all(
                                    Color(0xff921006)),
                                visualDensity: VisualDensity(horizontal: -4),
                                checkColor: Colors.white,
                                value: true,
                                onChanged: (x) {}),
                            SizedBox(
                              width: 8,
                            ),
                            CustomText(
                              text: "Remember me",
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            changeScreen(context, ForgotPassword());
                          },
                          child: CustomText(
                            text: "Forgot Password?",
                            color: appColor2,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    loading
                        ? Center(child: CircularProgressIndicator())
                        : Center(
                            child: GradientButton(
                              title: "Submit",
                              textClr: Colors.white,
                              clrs: [appColor, appColor],
                              onpressed: () {
                                signin();
                              },
                            ),
                          ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              children: [
                                TextSpan(text: "Dont have an account ? "),
                                TextSpan(
                                    style: TextStyle(color: Color(0xff921006)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () =>
                                          changeScreen(context, Register()),
                                    text: "Register")
                              ])),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signin() async {
    loading = true;
    setState(() {});
    try {
      final apiResult = await HttpService.post(
        Api.login,
        {
          "username": usernameController.text,
          "password": passwordController.text,
        },
      );
      print(apiResult.data);
      //Map<String, String> result = apiResult.data as Map<String, String>;
      final result = jsonDecode(apiResult.data);
      print(result);
      if (result["Status"] == "succcess") {
        LocalStorage().setString("username", usernameController.text);
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
                child: BottomNavbar(
                    username: usernameController.text, pageIndex: 0)),
            (route) => false);
      } else {
        showDialog(
            context: context,
            builder: (ctx) => ShowDialogWidget(
                  titleText: result["Report"],
                  subText: "Please check your sign in credentials",
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
