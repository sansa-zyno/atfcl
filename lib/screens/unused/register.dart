/*import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/login.dart';
import 'package:atfcl_fintech/screens/personal_info.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
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
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Phone number",
                color: appColor,
                weight: FontWeight.bold,
                size: 16,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45),
                          borderRadius: BorderRadius.circular(8)),
                      child: CustomText(text: "+234")),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45),
                          borderRadius: BorderRadius.circular(8)),
                      child: CustomText(text: "09030808173"),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Enter OTP",
                color: appColor,
                size: 16,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 50,
                width: double.infinity,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: Colors.black45))),
                        child: CustomText(text: "Enter OTP"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 3, 3, 3),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color(0xff921006),
                          borderRadius: BorderRadius.circular(8)),
                      child: CustomText(
                        text: "Send OTP",
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Checkbox(
                      fillColor: MaterialStateProperty.all(Color(0xff921006)),
                      visualDensity: VisualDensity(horizontal: -4),
                      checkColor: Colors.white,
                      value: true,
                      onChanged: (x) {}),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: CustomText(
                      text: "Click “Confirm” to accept Terms and Conditions",
                      size: 16,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  //changeScreen(context, PersonalInfo());
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
                        text: "Confirm",
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
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(text: "Already have an account? "),
                          TextSpan(
                              style: TextStyle(color: Color(0xff921006)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => changeScreen(context, Login()),
                              text: "Log in")
                        ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/
