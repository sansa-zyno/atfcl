/*import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/transactions/send_to_beneficiary.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
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
    return Scaffold(
      backgroundColor: appColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_back_ios_new,
                  color: appColor2,
                  size: 20,
                ),
                Spacer(),
                CustomText(
                  text: "Send To Bank",
                  color: Colors.white,
                  size: 16,
                ),
                Spacer(),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          Expanded(
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
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        changeScreen(context, SendToBeneficiary());
                      },
                      child: Container(
                        height: 100,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff25D366),
                                  Color(0xff25D366).withOpacity(0.3),
                                  Color(0xffFFFFFF)
                                ]),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: appColor,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                      TextSpan(text: "Send to Bank \n"),
                                      TextSpan(text: "Account")
                                    ])),
                                SizedBox(
                                  width: 15,
                                ),
                                Image.asset("assets/images/arrow.png",
                                    width: 32),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                            Container(
                              width: 100,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8))),
                              child: Image.asset(
                                "assets/images/cash-money.png",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    TextSpan(text: "Send to Virtual \n"),
                                    TextSpan(text: "Account")
                                  ])),
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                "assets/images/arrow.png",
                                width: 32,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          Container(
                            width: 100,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xff25D366),
                                      Color(0xff25D366),
                                      Color(0xffFFFFFF)
                                    ]),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8))),
                            child: Image.asset(
                              "assets/images/money-transfer.png",
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}*/
