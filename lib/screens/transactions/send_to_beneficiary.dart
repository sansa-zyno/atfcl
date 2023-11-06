/*import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/transactions/send_to_wallet.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SendToBeneficiary extends StatefulWidget {
  const SendToBeneficiary({Key? key}) : super(key: key);

  @override
  State<SendToBeneficiary> createState() => _SendToBeneficiaryState();
}

class _SendToBeneficiaryState extends State<SendToBeneficiary> {
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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: "Choose a beneficiary, or send to a new beneficiary",
                size: 14,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 0,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "John Doe",
                                    color: appColor,
                                    weight: FontWeight.bold,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(right: 15),
                                        decoration: BoxDecoration(
                                            border:
                                                Border(right: BorderSide())),
                                        child: CustomText(
                                          text: "0123456789",
                                          size: 14,
                                        ),
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(left: 15),
                                          child: CustomText(
                                            text: "Wallet Id",
                                            size: 14,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              )
                            ],
                          ));
                    }),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    barrierColor: Colors.transparent,
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    builder: (BuildContext ctx) {
                      return SendToWallet();
                    });
              },
              child: Image.asset(
                "assets/images/Group 63.png",
                height: 70,
              )),
        )
      ],
    );
  }
}*/
