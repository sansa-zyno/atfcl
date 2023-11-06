import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/investment/new_fixed_goalname.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FixedDeposit extends StatelessWidget {
  const FixedDeposit({super.key});

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
                  text: "Fixed Deposit",
                  size: 18,
                  weight: FontWeight.bold,
                ),
                Spacer()
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text:
                        "Note: A commitment fee of N2,000 is to be made before the start of any investment plan",
                    size: 16,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      changeScreen(
                          context,
                          NewFixedGoalName(
                            type: "monthly",
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffD2D8F1),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/monthly.png"),
                          SizedBox(
                            height: 15,
                          ),
                          CustomText(
                            text: "Monthly Fixed Deposit Plan",
                            weight: FontWeight.bold,
                            size: 16,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomText(text: "Minimum Fixed Amount: N100,000"),
                          SizedBox(
                            height: 8,
                          ),
                          CustomText(text: "Minimum Fixed Period: 1year"),
                          SizedBox(
                            height: 8,
                          ),
                          CustomText(
                              text:
                                  "Interest Rate: N6,225 in every 30 working days"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      changeScreen(
                          context,
                          NewFixedGoalName(
                            type: "quarterly",
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffD2D8F1),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/quaterly.png"),
                          SizedBox(
                            height: 15,
                          ),
                          CustomText(
                            text: "Quarterly Fixed Deposit Plan",
                            weight: FontWeight.bold,
                            size: 16,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomText(text: "Minimum Fixed Amount: N50,000"),
                          SizedBox(
                            height: 8,
                          ),
                          CustomText(text: "Minimum Fixed Period: 1year"),
                          SizedBox(
                            height: 8,
                          ),
                          CustomText(
                              text:
                                  "Interest Rate: N2,097 in every 90 working days"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
