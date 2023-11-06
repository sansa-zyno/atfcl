import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                    text: "Reset password",
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
                text: "Password must contain at least 8 characters",
                size: 16,
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "New password",
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
                      CustomText(text: "Password"),
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Confirm password",
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
                  children: [CustomText(text: "Password")],
                ),
              ),
              SizedBox(
                height: 30,
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
                        text: "Continue",
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
