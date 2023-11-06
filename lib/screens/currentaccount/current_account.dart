import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/currentaccount/current_account_wallet.dart';
import 'package:atfcl_fintech/screens/currentaccount/current_register.dart';
import 'package:atfcl_fintech/screens/transactions/enter_pin.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CurrentAccount extends StatefulWidget {
  const CurrentAccount({super.key});

  @override
  State<CurrentAccount> createState() => _CurrentAccountState();
}

class _CurrentAccountState extends State<CurrentAccount> {
  List currentAccts = [
    {
      "name": "0153762367",
      "type": "Individual",
      "balance": "\u20A6100,000",
      "icon": "assets/images/individual.png"
    },
    {
      "name": "2153762367",
      "type": "Joint",
      "balance": "\u20A6300,000",
      "icon": "assets/images/joint.png"
    },
  ];
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
                  text: "Current Accounts",
                  size: 18,
                  weight: FontWeight.bold,
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: currentAccts.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        changeScreen(context, CurrentAccountWallet());
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(currentAccts[index]["icon"]),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: currentAccts[index]["name"],
                                  size: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      text: "Balance",
                                      size: 16,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    CustomText(
                                        text: currentAccts[index]["balance"],
                                        size: 16,
                                        weight: FontWeight.bold)
                                  ],
                                )
                              ],
                            ),
                            Divider(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Account type",
                                      size: 16,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    CustomText(
                                        text: currentAccts[index]["type"],
                                        size: 16,
                                        weight: FontWeight.bold)
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black45),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: CustomText(
                                    text: "ACTIVE",
                                    color: appColor,
                                    weight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appColor2,
          onPressed: () {
            //changeScreen(context, SendToBeneficiary());
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                builder: (BuildContext ctx) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Choose Current Account Type",
                              size: 18,
                              color: appColor,
                              weight: FontWeight.bold,
                            ),
                            Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: appColor),
                                    borderRadius: BorderRadius.circular(8)),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.close, color: appColor)))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            changeScreen(context, EnterPin(
                              callBack: () {
                                changeScreen(context,
                                    CurrentRegister(type: "Individual"));
                              },
                            ));
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Individual",
                                  size: 16,
                                  color: appColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text:
                                      "Create current account as an individual",
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            changeScreen(context, EnterPin(
                              callBack: () {
                                changeScreen(
                                    context, CurrentRegister(type: "Joint"));
                              },
                            ));
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Joint",
                                  size: 16,
                                  color: appColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text: "Create a joint current account",
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
