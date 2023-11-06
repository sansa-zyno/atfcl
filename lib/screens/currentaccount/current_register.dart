import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/currentaccount/current_account_wallet.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CurrentRegister extends StatefulWidget {
  final String type;
  const CurrentRegister({required this.type});

  @override
  State<CurrentRegister> createState() => _CurrentRegisterState();
}

class _CurrentRegisterState extends State<CurrentRegister> {
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
                  text: "Current Accout Registeration",
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
                    text: "BVN",
                    size: 16,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CurvedTextField(
                    hint: "BVN",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text: "Type",
                    size: 16,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Row(
                      children: [
                        CustomText(
                          text: widget.type,
                          size: 16,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GradientButton(
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
                                        "Your current account was created successfully",
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
                                      changeScreen(
                                          context, CurrentAccountWallet());
                                    },
                                    clrs: [appColor, appColor],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              )));
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
