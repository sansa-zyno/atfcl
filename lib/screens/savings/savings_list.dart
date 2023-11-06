import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/savings/savings.dart';
import 'package:atfcl_fintech/screens/savings/savings_wallet.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SavingsList extends StatefulWidget {
  const SavingsList({super.key});

  @override
  State<SavingsList> createState() => _SavingsListState();
}

class _SavingsListState extends State<SavingsList> {
  List savings = [
    {
      "name": "Savings Goal Name",
      "type": "Thrift Savings",
      "balance": "\u20A65,000",
      "interest": "0%",
      "icon": "assets/images/tsavings.png"
    },
    {
      "name": "Savings Goal Name",
      "type": "Voluntary Savings",
      "balance": "\u20A67,000",
      "interest": "0%",
      "icon": "assets/images/vtsavings.png"
    },
    {
      "name": "Savings Goal Name",
      "type": "Food Festival",
      "balance": "\u20A68,000",
      "interest": "0%",
      "icon": "assets/images/fsavings.png"
    },
    {
      "name": "Savings Goal Name",
      "type": "Edu Savings",
      "balance": "\u20A610,000",
      "interest": "4%",
      "icon": "assets/images/edusavings.png"
    },
    {
      "name": "Savings Goal Name",
      "type": "Property Savings",
      "balance": "\u20A612,000",
      "interest": "0%",
      "icon": "assets/images/property.png"
    },
    {
      "name": "Savings Goal Name",
      "type": "Retirement Savings",
      "balance": "\u20A630,000",
      "interest": "0%",
      "icon": "assets/images/retirement.png"
    },
    {
      "name": "Savings Goal Name",
      "type": "Land Savings",
      "balance": "\u20A6500,000",
      "interest": "0%",
      "icon": "assets/images/land.png"
    },
    {
      "name": "Savings Goal Name",
      "type": "Rent Savings",
      "balance": "\u20A650,000",
      "interest": "6.05%",
      "icon": "assets/images/rent.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Savings",
          weight: FontWeight.bold,
          size: 16,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: savings.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () {
                changeScreen(context, SavingsWallet());
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
                    Image.asset(savings[index]["icon"]),
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
                              text: savings[index]["name"],
                              size: 16,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomText(
                                text: savings[index]["type"],
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
                                text: savings[index]["balance"],
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
                                text: savings[index]["interest"],
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
        backgroundColor: appColor2,
        onPressed: () {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  insetPadding: EdgeInsets.all(8),
                  contentPadding: EdgeInsets.all(15),
                  content: Savings()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
