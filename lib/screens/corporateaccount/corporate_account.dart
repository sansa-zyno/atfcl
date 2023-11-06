import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/corporateaccount/Corporate_register.dart';
import 'package:atfcl_fintech/screens/corporateaccount/corporate_account_wallet.dart';
import 'package:atfcl_fintech/screens/transactions/enter_pin.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CorporateAccount extends StatefulWidget {
  const CorporateAccount({super.key});

  @override
  State<CorporateAccount> createState() => _CorporateAccountState();
}

class _CorporateAccountState extends State<CorporateAccount> {
  List corporateAccts = [
    {
      "name": "3153762367",
      "type": "Association",
      "balance": "\u20A6200,000",
      "icon": "assets/images/association.png"
    },
    {
      "name": "3253162367",
      "type": "Logistics",
      "balance": "\u20A6300,000",
      "icon": "assets/images/logistics.png"
    },
    {
      "name": "1253162367",
      "type": "Restaurant",
      "balance": "\u20A6350,000",
      "icon": "assets/images/restaurant.png"
    },
    {
      "name": "2253162367",
      "type": "School Owner",
      "balance": "\u20A6500,000",
      "icon": "assets/images/schoolowner.png"
    },
    {
      "name": "5253162367",
      "type": "Transportation",
      "balance": "\u20A6550,000",
      "icon": "assets/images/transportation.png"
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
                  text: "Corporate Accounts",
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
                  itemCount: corporateAccts.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        changeScreen(context, CorporateAccountWallet());
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
                            Image.asset(corporateAccts[index]["icon"]),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: corporateAccts[index]["name"],
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
                                        text: corporateAccts[index]["balance"],
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
                                        text: corporateAccts[index]["type"],
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
                isScrollControlled: true,
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
                              text: "Choose Corporate Account Type",
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
                                    CorporateRegister(type: "Association"));
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
                                  text: "Association",
                                  size: 16,
                                  color: appColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text:
                                      "Create corporate account for a meeting or association",
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
                                changeScreen(context,
                                    CorporateRegister(type: "Logistics"));
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
                                  text: "Logistics",
                                  size: 16,
                                  color: appColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text:
                                      "Create corporate account for Logistics",
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
                                changeScreen(context,
                                    CorporateRegister(type: "Restaurant"));
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
                                  text: "Restaurant",
                                  size: 16,
                                  color: appColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text:
                                      "Create corporate account for Restaurant",
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
                                changeScreen(context,
                                    CorporateRegister(type: "School Owner"));
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
                                  text: "School Owner",
                                  size: 16,
                                  color: appColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text:
                                      "Create corporate account for School Owner",
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
                                changeScreen(context,
                                    CorporateRegister(type: "Transportation"));
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
                                  text: "Transportation",
                                  size: 16,
                                  color: appColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text:
                                      "Create corporate account for Transportation",
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
