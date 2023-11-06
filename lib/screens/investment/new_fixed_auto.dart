import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/investment/new_fixed_setup.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NewFixedAuto extends StatefulWidget {
  final String type;
  const NewFixedAuto({required this.type});

  @override
  State<NewFixedAuto> createState() => _NewFixedAutoState();
}

class _NewFixedAutoState extends State<NewFixedAuto> {
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
                  "New Fixed Deposit Funding ",
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
                      text: "Amount",
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CurvedTextField(
                      hint: "${widget.type == "monthly" ? "100000" : "50000"}",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      text: "Start Date",
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset(2, 2))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "25/10/2023"),
                          Icon(Icons.calendar_month)
                        ],
                      ),
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
                            NewFixedSetup(
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
