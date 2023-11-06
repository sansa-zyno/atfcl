import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/savings/new_savings_setup2.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NewSavingsVoluntary extends StatefulWidget {
  final String type;
  const NewSavingsVoluntary({required this.type});

  @override
  State<NewSavingsVoluntary> createState() => _NewSavingsVoluntaryState();
}

class _NewSavingsVoluntaryState extends State<NewSavingsVoluntary> {
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
                    )),
                Spacer(),
                Text(
                  "New Savings Funding ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                        text: "Amount", size: 16, weight: FontWeight.bold),
                    SizedBox(
                      height: 8,
                    ),
                    CurvedTextField(
                      hint: "1000",
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GradientButton(
                      title: "Continue",
                      clrs: [appColor, appColor],
                      onpressed: () {
                        changeScreen(
                            context,
                            NewSavingsSetup(
                              type: widget.type,
                            ));
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
