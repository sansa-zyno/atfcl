import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CorporateAccountWallet extends StatefulWidget {
  const CorporateAccountWallet({super.key});

  @override
  State<CorporateAccountWallet> createState() => _CorporateAccountWalletState();
}

class _CorporateAccountWalletState extends State<CorporateAccountWallet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 30,
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
                  text: "Corporate Account Wallet",
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        width: double.infinity,
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
                            CustomText(
                              text: "BALANCE",
                              color: Colors.black54,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              text: "N0.0",
                              size: 16,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 30),
                            decoration: BoxDecoration(
                                color: appColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ]),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                CustomText(
                                  text: "Add Funds",
                                  color: Colors.white,
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 30),
                              decoration: BoxDecoration(
                                  color: appColor2,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ]),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.download,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CustomText(
                                    text: "Withdraw",
                                    color: Colors.white,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Account Type",
                            size: 16,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomText(
                              text: "Association",
                              size: 16,
                              weight: FontWeight.bold)
                        ],
                      ),
                      Divider(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Created Date",
                            size: 16,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomText(
                              text: "2023-08-04",
                              size: 16,
                              weight: FontWeight.bold)
                        ],
                      ),
                      Divider(
                        height: 15,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: CustomText(
                          text: "Corporate Account History",
                          size: 16,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
