import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/savings/new_savings_summary.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NewFixedSetup extends StatefulWidget {
  final String type;
  const NewFixedSetup({required this.type});

  @override
  State<NewFixedSetup> createState() => _NewFixedSetupState();
}

class _NewFixedSetupState extends State<NewFixedSetup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  text: "New Fixed Deposit Duration",
                  size: 18,
                  weight: FontWeight.bold,
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: 30,
            ),
            widget.type == "quarterly"
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: CustomText(
                          text: "How do you want to get your interest paid ?",
                          size: 16,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Wrap(
                          spacing: 7,
                          runSpacing: 15,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ]),
                              child: CustomText(text: "60 days"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ]),
                              child: CustomText(text: "90 days"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ]),
                              child: CustomText(text: "120 days"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ]),
                              child: CustomText(text: "150 days"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ]),
                              child: CustomText(text: "180 days"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ]),
                              child: CustomText(text: "210 days"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ]),
                              child: CustomText(text: "240 days"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ]),
                              child: CustomText(text: "270 days"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ]),
                              child: CustomText(text: "300 days"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ]),
                              child: CustomText(text: "330 days"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ]),
                              child: CustomText(text: "360 days"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            /* Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(2, 2))
                        ]),
                    child: CustomText(text: "Pick my date"),
                  ),*/
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Maturity period",
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        text: "30 days",
                        size: 16,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                  Divider(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Minimum fund amount",
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        text: "N100000",
                        size: 16,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                  Divider(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Monthly interest rate",
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        text: "N6,225",
                        size: 16,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                  Divider(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Matures by",
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        text: "04/1/2023",
                        size: 16,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                  Divider(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Withdrawal possible by",
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        text: "04/1/2033",
                        size: 16,
                        weight: FontWeight.bold,
                      )
                    ],
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
                          NewSavingsSummary(
                            type: "fixed",
                          ));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
