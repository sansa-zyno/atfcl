import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/savings/new_savings_goalname.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Savings extends StatelessWidget {
  const Savings({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 15,
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
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    changeScreen(
                        context,
                        NewSavingsGoalName(
                          type: "thrift",
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffD2D8F1),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/tsavings.png"),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: "Thrift Savings",
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                            text: "Your daily, weekly & monthly savings"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    changeScreen(
                        context,
                        NewSavingsGoalName(
                          type: "vthrift",
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffD2D8F1),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/vtsavings.png"),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: "Voluntary Savings",
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(text: "Save any amount of your choice"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    changeScreen(
                        context,
                        NewSavingsGoalName(
                          type: "food",
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffD2D8F1),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/fsavings.png"),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: "Food Festival",
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(text: "Save for Xmas ahead of time"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    changeScreen(
                        context,
                        NewSavingsGoalName(
                          type: "education",
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffD2D8F1),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/edusavings.png"),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: "Edu Savings",
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(text: "Save any amount of your choice"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    changeScreen(
                        context,
                        NewSavingsGoalName(
                          type: "property",
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffD2D8F1),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/property.png"),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: "Property Savings",
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                            text: "Save for house property of your choice"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    changeScreen(
                        context,
                        NewSavingsGoalName(
                          type: "retirement",
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffD2D8F1),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/retirement.png"),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: "Retirement Savings",
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                            text: "Get interest while saving for retirement"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    changeScreen(
                        context,
                        NewSavingsGoalName(
                          type: "land",
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffD2D8F1),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/land.png"),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: "Land Banking",
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                            text: "Save with a minimum of 500 daily for land"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    changeScreen(
                        context,
                        NewSavingsGoalName(
                          type: "rent",
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffD2D8F1),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/rent.png"),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: "Rent Savings",
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                            text: "Save for your shop, office or house rent"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
