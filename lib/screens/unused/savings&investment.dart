/*import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/screens/savingsandinvestment/fixed_deposit.dart';
import 'package:atfcl_fintech/screens/savingsandinvestment/fixed_deposit_list.dart';
import 'package:atfcl_fintech/screens/savingsandinvestment/savings.dart';
import 'package:atfcl_fintech/screens/savingsandinvestment/savings_list.dart';
import 'package:flutter/material.dart';

class SavingsAndInvestment extends StatefulWidget {
  const SavingsAndInvestment({super.key});

  @override
  State<SavingsAndInvestment> createState() => _SavingsAndInvestmentState();
}

class _SavingsAndInvestmentState extends State<SavingsAndInvestment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
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
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      )),
                  Spacer(),
                  Text(
                    "Savings & Investments",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TabBar(
                //indicatorColor: Colors.black,
                unselectedLabelColor: Colors.grey,

                labelColor: appColor,
                indicatorColor: appColor2,
                tabs: [
                  Tab(
                    child: Row(children: [
                      Text("Savings Plan", style: TextStyle(fontSize: 16)),
                    ]),
                  ),
                  Tab(
                    child: Row(children: [
                      Text("Fixed Deposit Plan", style: TextStyle(fontSize: 16))
                    ]),
                  ),
                ],
              ),
              Expanded(
                child:
                    TabBarView(children: [SavingsList(), FixedDepositList()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
