import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/savings/new_savings_auto.dart';
import 'package:atfcl_fintech/screens/savings/new_savings_voluntary.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NewSavingsGoalName extends StatefulWidget {
  final String type;
  const NewSavingsGoalName({required this.type});

  @override
  State<NewSavingsGoalName> createState() => _NewSavingsGoalNameState();
}

class _NewSavingsGoalNameState extends State<NewSavingsGoalName> {
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
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                Spacer(),
                CustomText(
                  text: "New Savings Goal",
                  size: 18,
                  weight: FontWeight.bold,
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: "Goal Name", size: 16, weight: FontWeight.bold),
                  SizedBox(
                    height: 8,
                  ),
                  CurvedTextField(
                    hint: "Goal Name",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                      text: "Whats your saving target (N)?",
                      size: 16,
                      weight: FontWeight.bold),
                  SizedBox(
                    height: 8,
                  ),
                  CurvedTextField(
                    hint: "500",
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GradientButton(
                    onpressed: () {
                      switch (widget.type) {
                        case "thrift":
                          return changeScreen(
                              context, NewSavingsAuto(type: widget.type));
                        case "vthrift":
                          return changeScreen(
                              context, NewSavingsVoluntary(type: widget.type));
                        case "food":
                          return changeScreen(
                              context, NewSavingsAuto(type: widget.type));
                        case "education":
                          return changeScreen(
                              context, NewSavingsAuto(type: widget.type));
                        case "property":
                          return changeScreen(
                              context, NewSavingsAuto(type: widget.type));
                        case "retirement":
                          return changeScreen(
                              context, NewSavingsAuto(type: widget.type));
                        case "land":
                          return changeScreen(
                              context, NewSavingsAuto(type: widget.type));
                        case "rent":
                          return changeScreen(
                              context, NewSavingsAuto(type: widget.type));
                      }
                    },
                    title: "Continue",
                    clrs: [appColor, appColor],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
