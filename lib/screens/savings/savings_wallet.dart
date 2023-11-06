import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SavingsWallet extends StatefulWidget {
  const SavingsWallet({super.key});

  @override
  State<SavingsWallet> createState() => _SavingsWalletState();
}

class _SavingsWalletState extends State<SavingsWallet> {
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
                  text: "Savings Wallet",
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
                            onTap: () {
                              //thrift: take one day saving;1500/750;2000/1000 and so on
                              //vthrift: take 15000/500;30000/750; below 100k/1000;above 100k/1500
                              //food:
                              //edu:4%
                              //property
                              //retirement:4% on 100k annually
                              //land:1000
                              //rent:Above 100000/1k
                            },
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
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Target",
                                size: 16,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                  text: "N252.00",
                                  size: 16,
                                  weight: FontWeight.bold)
                            ],
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
                                  text: "N235.00",
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
                                text: "Saving Frequency",
                                size: 16,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                  text: "N252.00/Weekly",
                                  size: 16,
                                  weight: FontWeight.bold)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomText(
                                text: "Saving Plan",
                                size: 16,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                  text: "DEFAULT",
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
                                text: "Interest P/A",
                                size: 16,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                  text: "6.05%",
                                  size: 16,
                                  weight: FontWeight.bold)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomText(
                                text: "Accrued interest",
                                size: 16,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                  text: "N0.00",
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
                                text: "Next Saving Date",
                                size: 16,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                  text: "2023-08-25",
                                  size: 16,
                                  weight: FontWeight.bold)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomText(
                                text: "Start Date",
                                size: 16,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                  text: "2023-07-25",
                                  size: 16,
                                  weight: FontWeight.bold)
                            ],
                          )
                        ],
                      ),
                      Divider(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Maturity Date",
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
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Automatic Deposit",
                                size: 16,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                  text: "ACTIVE",
                                  size: 16,
                                  weight: FontWeight.bold)
                            ],
                          ),
                          Switch(
                              activeColor: appColor,
                              activeTrackColor: Colors.black12,
                              value: true,
                              onChanged: (x) {})
                        ],
                      ),
                      Divider(
                        height: 15,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: CustomText(
                          text: "Savings History",
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
