/*import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/constants/app_images.dart';
import 'package:atfcl_fintech/constants/app_strings.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/merchants2.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Merchants extends StatefulWidget {
  const Merchants({Key? key}) : super(key: key);

  @override
  State<Merchants> createState() => _MerchantsState();
}

class _MerchantsState extends State<Merchants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Stack(
        children: [
          Positioned(
              top: 0, left: 15, child: Image.asset(heart_red_2, width: 70)),
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: titleBarOffset,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        /*InkWell(
                          onTap: () {
                            changeScreenRemoveUntill(context, Home());
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),*/
                        Spacer(),
                        CustomText(
                          text: "Merchants",
                          color: Colors.white,
                          size: 16,
                        ),
                        Spacer(),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text:
                          "Start a chat directly with brands that have\n partnered with us to meet your needs",
                      textAlign: TextAlign.center,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(image: AssetImage(stickers)),
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
                          height: 15,
                        ),
                        Container(
                          width: 311,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: Offset(2, 2))
                              ]),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  //controller: controller,
                                  //keyboardType: type ?? TextInputType.text,
                                  //obscureText: obsecureText ?? false,
                                  decoration: new InputDecoration(
                                      prefix: Text("   "),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: appColor,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      alignLabelWithHint: false,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      hintText: 'Search merchants',
                                      labelStyle: TextStyle(
                                        fontFamily: "Nunito",
                                      ),
                                      hintStyle: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 14,
                                          color: appColor)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child:
                              ListView(padding: EdgeInsets.all(0), children: [
                            ListTile(
                                onTap: () async {
                                  changeScreen(
                                      context,
                                      Merchants2(
                                        category: "Travel",
                                      ));
                                },
                                leading: Icon(
                                  Icons.travel_explore_sharp,
                                  size: 20,
                                  color: appColor,
                                ),
                                title: CustomText(
                                  text: "Travel",
                                  color: appColor,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: appColor,
                                  size: 20,
                                )),
                            ListTile(
                                onTap: () async {
                                  changeScreen(
                                      context,
                                      Merchants2(
                                        category: "Hospitality",
                                      ));
                                },
                                leading: Icon(
                                  Icons.local_hospital_sharp,
                                  size: 20,
                                  color: appColor,
                                ),
                                title: CustomText(
                                  text: "Hospitality",
                                  color: appColor,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: appColor,
                                  size: 20,
                                )),
                            ListTile(
                                onTap: () async {
                                  changeScreen(
                                      context,
                                      Merchants2(
                                        category: "Cinema",
                                      ));
                                },
                                leading: Icon(
                                  Icons.radio,
                                  size: 20,
                                  color: appColor,
                                ),
                                title: CustomText(
                                  text: "Cinema",
                                  color: appColor,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: appColor,
                                  size: 20,
                                )),
                            ListTile(
                                onTap: () async {
                                  changeScreen(
                                      context,
                                      Merchants2(
                                        category: "Restaurants",
                                      ));
                                },
                                leading: Icon(
                                  Icons.cancel_sharp,
                                  size: 20,
                                  color: appColor,
                                ),
                                title: CustomText(
                                  text: "Restaurants",
                                  color: appColor,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: appColor,
                                  size: 20,
                                )),
                            ListTile(
                                onTap: () async {
                                  changeScreen(
                                      context,
                                      Merchants2(
                                        category: "Shopping",
                                      ));
                                },
                                leading: Icon(
                                  Icons.shopping_cart,
                                  size: 20,
                                  color: appColor,
                                ),
                                title: CustomText(
                                  text: "Shopping",
                                  color: appColor,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: appColor,
                                  size: 20,
                                ))
                          ]),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}*/
