import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/bottom_navbar.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final String username;
  const Welcome({required this.username, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          CustomText(
            text: "Welcome To Assurance Trust",
            size: 22,
            color: appColor,
            weight: FontWeight.bold,
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset(
            "assets/images/investment .gif",
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomText(
              text:
                  "Your account was created successfully, Click “Next to move to the homepage",
              size: 18,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/arrow.png",
                  width: 50,
                  color: appColor,
                ),
                InkWell(
                  onTap: () {
                    changeScreen(context,
                        BottomNavbar(username: username, pageIndex: 0));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: CustomText(
                      text: "Next",
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
