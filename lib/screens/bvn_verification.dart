import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BVNVerification extends StatefulWidget {
  const BVNVerification({Key? key}) : super(key: key);

  @override
  State<BVNVerification> createState() => _BVNVerificationState();
}

class _BVNVerificationState extends State<BVNVerification> {
  TextEditingController bvnSsnController = TextEditingController();

  bool loading = false;

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
                    Icons.arrow_back_ios_new,
                    color: appColor,
                    size: 20,
                  ),
                ),
                Spacer(),
                CustomText(
                  text: "BVN Verification",
                  size: 18,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 8,
                ),
                Spacer(),
                SizedBox(
                  width: 30,
                ),
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
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: "BVN",
                    size: 16,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CurvedTextField(
                    hint: "",
                    controller: bvnSsnController,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  loading
                      ? Container(
                          width: 283,
                          child: Center(child: CircularProgressIndicator()))
                      : GradientButton(
                          title: "Verify",
                          textClr: Colors.white,
                          clrs: [appColor, appColor],
                          onpressed: () async {},
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
