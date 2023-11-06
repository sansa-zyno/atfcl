import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/investment/fixed_deposit_wallet.dart';
import 'package:atfcl_fintech/screens/savings/savings_wallet.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NewSavingsSummary extends StatefulWidget {
  final String type;
  const NewSavingsSummary({required this.type});

  @override
  State<NewSavingsSummary> createState() => _NewSavingsSummaryState();
}

class _NewSavingsSummaryState extends State<NewSavingsSummary> {
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
                  text:
                      "${widget.type == "savings" ? "New Savings Summary" : "New Fixed Deposit Summary"}",
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
                children: [
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/tsavings.png"),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text:
                                      "${widget.type == "savings" ? "Savings Goal Name" : "Fixed Deposit Goal Name"}",
                                  size: 16,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomText(
                                  text: "Repair",
                                  size: 16,
                                  weight: FontWeight.bold,
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45),
                                  borderRadius: BorderRadius.circular(30)),
                              child: CustomText(
                                text: "Not Started",
                                size: 16,
                                color: appColor,
                                weight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Fund with",
                                  size: 16,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomText(
                                  text: "N252.00",
                                  size: 16,
                                  weight: FontWeight.bold,
                                )
                              ],
                            ),
                            widget.type == "savings"
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomText(
                                        text: "Target",
                                        size: 16,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      CustomText(
                                        text: "N235.00",
                                        size: 16,
                                      )
                                    ],
                                  )
                                : Container()
                          ],
                        ),
                        Divider(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text:
                                      "${widget.type == "savings" ? "Saving Tier" : "Fixed Deposit Tier"}",
                                  size: 16,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  text: "Interest Rate",
                                  size: 16,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomText(
                                  text: "6.05%",
                                  size: 16,
                                )
                              ],
                            )
                          ],
                        ),
                        Divider(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Maturity Period",
                                  size: 16,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomText(
                                  text:
                                      "${widget.type == "savings" ? "10 days" : "30 days"}",
                                  size: 16,
                                  weight: FontWeight.bold,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Matures By",
                                  size: 16,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomText(
                                  text: "04/08/2023",
                                  size: 16,
                                  weight: FontWeight.bold,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GradientButton(
                    title: "Fund",
                    clrs: [appColor, appColor],
                    onpressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              insetPadding: EdgeInsets.all(15),
                              contentPadding: EdgeInsets.all(15),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black12, width: 3.0),
                                        shape: BoxShape.circle),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.check,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  CustomText(
                                    text: "Congratualations!",
                                    size: 24,
                                    weight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  CustomText(
                                    text:
                                        "${widget.type == "savings" ? "Your saving plan was created successfully" : "Your fixed deposit plan was created successfully"}",
                                    size: 18,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  GradientButton(
                                    title: "View Plan",
                                    onpressed: () {
                                      Navigator.pop(context);
                                      widget.type == "savings"
                                          ? changeScreen(
                                              context, SavingsWallet())
                                          : changeScreen(
                                              context, FixedDepositWallet());
                                    },
                                    clrs: [appColor, appColor],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              )));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
