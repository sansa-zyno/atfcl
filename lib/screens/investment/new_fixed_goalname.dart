import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/investment/new_fixed_auto.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NewFixedGoalName extends StatefulWidget {
  final String type;
  const NewFixedGoalName({required this.type});

  @override
  State<NewFixedGoalName> createState() => _NewFixedGoalNameState();
}

class _NewFixedGoalNameState extends State<NewFixedGoalName> {
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
                  text: "New Fixed Deposit Goal",
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
                    text: "Goal Name",
                    size: 16,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CurvedTextField(
                    hint: "Goal Name",
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GradientButton(
                    onpressed: () {
                      switch (widget.type) {
                        case "monthly":
                          return changeScreen(
                              context, NewFixedAuto(type: widget.type));
                        case "quarterly":
                          return changeScreen(
                              context, NewFixedAuto(type: widget.type));
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
