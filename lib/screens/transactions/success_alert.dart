/*import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/constants/app_images.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Success extends StatefulWidget {
  String keyword;
  Success(this.keyword);
  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(stickers04)),
          //color: Color(0xFF1A0130)
          color: appColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
                top: 0, left: 15, child: Image.asset(heart_red_2, width: 70)),
            Positioned(
                top: 230,
                left: 0,
                child: Image.asset(
                  cards_on_hand,
                  width: 100,
                )),
            Positioned(
                top: 90,
                right: 0,
                child: Image.asset(
                  dollar,
                  width: 50,
                )),
            Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  car,
                  width: 70,
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  money_and_gold,
                  width: 70,
                )),
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: CustomText(
                      text: " Your ${widget.keyword} was Successful",
                      color: Colors.white,
                      textAlign: TextAlign.center),
                ),
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Image.asset(
                    hand_up,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 100,
                ),
                GradientButton(
                  title: "Back",
                  textClr: appColor,
                  clrs: [appColor, appColor],
                  onpressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/
