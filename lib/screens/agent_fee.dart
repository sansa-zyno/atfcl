import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AgentFee extends StatefulWidget {
  const AgentFee({super.key});

  @override
  State<AgentFee> createState() => _AgentFeeState();
}

class _AgentFeeState extends State<AgentFee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Agent Fee",
          weight: FontWeight.bold,
          size: 16,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            CustomText(
              text: "Agent Activation Fee",
              size: 16,
              color: appColor,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  CustomText(
                    text: "Free",
                    size: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color(0xff12246E),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Apply Now",
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
