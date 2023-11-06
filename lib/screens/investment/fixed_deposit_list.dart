import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/investment/fixed_deposit.dart';
import 'package:atfcl_fintech/screens/investment/fixed_deposit_wallet.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FixedDepositList extends StatefulWidget {
  const FixedDepositList({super.key});

  @override
  State<FixedDepositList> createState() => _FixedDepositListState();
}

class _FixedDepositListState extends State<FixedDepositList> {
  List fixedDeposits = [
    {
      "name": "Fixed Deposit Goal Name",
      "type": "Monthly",
      "balance": "\u20A6100,000",
      "interest": "\u20A66.225",
      "icon": "assets/images/monthly.png"
    },
    {
      "name": "Fixed Deposit Goal Name",
      "type": "Quaterly",
      "balance": "\u20A650,000",
      "interest": "\u20A62,097",
      "icon": "assets/images/quaterly.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Investment",
          weight: FontWeight.bold,
          size: 16,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: fixedDeposits.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () {
                changeScreen(context, FixedDepositWallet());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
                    Image.asset(fixedDeposits[index]["icon"]),
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
                              text: fixedDeposits[index]["name"],
                              size: 16,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomText(
                                text: fixedDeposits[index]["type"],
                                size: 16,
                                weight: FontWeight.bold)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(
                              text: "Savings Balance",
                              size: 16,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomText(
                                text: fixedDeposits[index]["balance"],
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
                              text: "Interest",
                              size: 16,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomText(
                                text: fixedDeposits[index]["interest"],
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColor,
        onPressed: () {
          changeScreen(context, FixedDeposit());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
