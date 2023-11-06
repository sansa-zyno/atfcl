import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/loan/loan_termsofuse.dart';
import 'package:atfcl_fintech/screens/transactions/enter_pin.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LoanGetStarted extends StatefulWidget {
  const LoanGetStarted({super.key});

  @override
  State<LoanGetStarted> createState() => _LoanGetStartedState();
}

class _LoanGetStartedState extends State<LoanGetStarted> {
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
                  Spacer(),
                  CustomText(
                    text: "Loan",
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
                text: "Get Started",
                size: 16,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: "Help us understand what you are looking for",
                size: 16,
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "How much do you need?",
                size: 16,
              ),
              SizedBox(
                height: 8,
              ),
              CurvedTextField(
                hint: "",
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: "Monthly income",
                size: 16,
              ),
              SizedBox(
                height: 8,
              ),
              CurvedTextField(
                hint: "",
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: "Email",
                size: 16,
              ),
              SizedBox(
                height: 8,
              ),
              CurvedTextField(
                hint: "",
              ),
              SizedBox(
                height: 50,
              ),
              GradientButton(
                title: "Continue",
                clrs: [appColor, appColor],
                onpressed: () {
                  changeScreen(context, EnterPin(
                    callBack: () {
                      changeScreen(context, LoanTermsOfUse());
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
