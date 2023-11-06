/*import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/constants/app_images.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewCard extends StatefulWidget {
  const NewCard({Key? key}) : super(key: key);

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Stack(
        children: [
          Positioned(
              top: 0, left: 15, child: Image.asset(heart_red_2, width: 70)),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: 270,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: appColor,
                            size: 20,
                          ),
                          Spacer(),
                          CustomText(
                            text: "Add New Card",
                            color: Colors.white,
                            size: 16,
                          ),
                          Spacer(),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Positioned(
                  top: 250,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        //image: DecorationImage(image: AssetImage(stickers)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [appColor, appColor],
                            stops: [0.02, 0.2]),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              width: 283,
                              child: CustomText(
                                text: "Card Number",
                                color: appColor,
                                weight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          CurvedTextField(
                            hint: "xxxx xxxx xxxx",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 283,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Expiry Date",
                                      color: appColor,
                                      weight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 58,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                blurRadius: 10,
                                                offset: Offset(2, 2))
                                          ]),
                                      child: CustomText(text: ""),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(text: "")
                                  ],
                                ),
                                Container(
                                  width: 130,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "CVV",
                                        color: appColor,
                                        weight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 58,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  blurRadius: 10,
                                                  offset: Offset(2, 2))
                                            ]),
                                        child: CustomText(text: ""),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomText(
                                            text: "What is cvv?",
                                            color: appColor,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          GradientButton(
                            title: "Add Card",
                            textClr: Colors.white,
                            clrs: [Color(0xffDAAFFF), Color(0xffDAAFFF)],
                            onpressed: () {},
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(hand_holding_cc),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/
