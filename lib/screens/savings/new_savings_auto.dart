import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/savings/new_savings_setup2.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NewSavingsAuto extends StatefulWidget {
  final String type;
  const NewSavingsAuto({required this.type});

  @override
  State<NewSavingsAuto> createState() => _NewSavingsAutoState();
}

class _NewSavingsAutoState extends State<NewSavingsAuto> {
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
                      height: 30,
                    ),
                    widget.type == "food"
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  text: "Categories",
                                  size: 16,
                                  weight: FontWeight.bold),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              blurRadius: 10,
                                              offset: Offset(2, 2))
                                        ]),
                                    child: CustomText(text: "Half Year"),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              blurRadius: 10,
                                              offset: Offset(2, 2))
                                        ]),
                                    child: CustomText(text: "Full Year"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          )
                        : Container(),
                    CustomText(
                        text: "Frequency", size: 16, weight: FontWeight.bold),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: Offset(2, 2))
                              ]),
                          child: CustomText(text: "Daily"),
                        ),
                        /* Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: 8, horizontal: 15),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(30),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color:
                                                                  Colors.grey.withOpacity(0.2),
                                                              blurRadius: 10,
                                                              offset: Offset(2, 2))
                                                        ]),
                                                    child: CustomText(text: "Weekly"),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: 8, horizontal: 15),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(30),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color:
                                                                  Colors.grey.withOpacity(0.2),
                                                              blurRadius: 10,
                                                              offset: Offset(2, 2))
                                                        ]),
                                                    child: CustomText(text: "Monthly"),
                                                  )*/
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                        text: "Start Date", size: 16, weight: FontWeight.bold),
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
