import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/unused/reset_password.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class EnterCode extends StatelessWidget {
  const EnterCode({super.key});

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
                    text: "Enter OTP",
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
                text: "Enter the four digit code you received in your phone.",
                size: 16,
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Enter code",
                size: 16,
                color: appColor,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 8,
              ),
              CurvedTextField(
                hint: "Enter code",
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  changeScreen(context, ResetPassword());
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
                        text: "Continue",
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
