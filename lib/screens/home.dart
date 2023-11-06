import 'dart:convert';
import 'dart:developer';
import 'package:atfcl_fintech/constants/api.dart';
import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/controller/app_provider.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/add_fund_online.dart';
import 'package:atfcl_fintech/screens/bottomsheets/fund_bank_transfer.dart';
import 'package:atfcl_fintech/screens/bvn_verification.dart';
import 'package:atfcl_fintech/screens/notifications.dart';
import 'package:atfcl_fintech/screens/profile.dart';
import 'package:atfcl_fintech/screens/transactions/send_to_wallet.dart';
import 'package:atfcl_fintech/screens/transactions/transaction_history.dart';
import 'package:atfcl_fintech/screens/transactions/withdraw.dart';
import 'package:atfcl_fintech/services/http.service.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:atfcl_fintech/widgets/menu.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_strings.dart';

class Home extends StatefulWidget {
  String username;
  Home({required this.username, super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List myAccounts = [];
  String val = "";
  int index = 0;
  List tempList = [];

  getMyAccounts() async {
    Response res =
        await HttpService.post(Api.userAccounts, {"username": widget.username});
    myAccounts = jsonDecode(res.data);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    super.initState();
    appProvider.getAccountDetails(widget.username);
    appProvider.getTransactions(widget.username);
    getMyAccounts();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    val = appProvider.accountDetails.isNotEmpty
        ? appProvider.accountDetails[index]["Accountnumber"]
        : "";
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Menu(
          username: widget.username,
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ]),
                            child: Icon(
                              Icons.menu,
                              color: appColor,
                            ),
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      /* CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: appProvider.imageUrl.startsWith("https")
                              ? Image.network(
                                  appProvider.imageUrl,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  "${appurl}/${appProvider.imageUrl}",
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),*/
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: "Hello, ${widget.username}",
                              size: 16,
                              weight: FontWeight.bold),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: "Tier 1 (Not verified)",
                            size: 16,
                          )
                        ],
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            changeScreen(context, Notifications());
                          },
                          child: Image.asset("assets/images/bell-outline.png")),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        color: appColor2,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Your Balance",
                              color: Colors.white,
                              size: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: DropdownButton<String>(
                                  value: val,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  ),
                                  underline: Container(),
                                  style: TextStyle(color: Colors.black),
                                  items: appProvider.accountDetails
                                      .map<DropdownMenuItem<String>>((value) {
                                    tempList.add(value["Accountnumber"]);
                                    return DropdownMenuItem(
                                        value: value["Accountnumber"],
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 10,
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    offset: Offset(2, 2))
                                              ]),
                                          child: CustomText(
                                            text: "${value["Accountnumber"]}",
                                            textAlign: TextAlign.center,
                                            size: 14,
                                            color: appColor,
                                            weight: FontWeight.bold,
                                          ),
                                        ));
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      val = value!;
                                      index = tempList.indexOf(value);
                                    });
                                  }),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: appProvider.accountDetails.isEmpty
                              ? ""
                              : "\u20A6${appProvider.accountDetails[index]["Amount"]}"
                                  .replaceAllMapped(reg, mathFunc),
                          color: Colors.white,
                          weight: FontWeight.bold,
                          size: 18,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "Account No",
                              color: Colors.white,
                              size: 16,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: appProvider.accountDetails.isEmpty
                                  ? ""
                                  : "${appProvider.accountDetails[index]["Accountnumber"]}",
                              color: Colors.white,
                              size: 16,
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            CustomText(
                              text: "Tier 1",
                              color: Colors.white,
                              size: 16,
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "Select Sending Options",
                                            size: 18,
                                            color: appColor,
                                            weight: FontWeight.bold,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: appColor),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(Icons.close,
                                                      color: appColor)))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                              barrierColor: Colors.transparent,
                                              context: context,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  30),
                                                          topRight:
                                                              Radius.circular(
                                                                  30))),
                                              builder: (BuildContext ctx) {
                                                return SingleChildScrollView(
                                                    child: SendToWallet());
                                              });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: "Assurance Trust Wallet",
                                                size: 16,
                                                color: appColor,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              CustomText(
                                                text:
                                                    "Send money to an Assurance Trust user",
                                                size: 16,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: "Bank Account",
                                              size: 16,
                                              color: appColor,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                              text:
                                                  "Send money to a bank number",
                                              size: 16,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              //border: Border.all(),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10.0,
                                    offset: Offset(2, 2),
                                    color: Colors.grey.withOpacity(0.2))
                              ]),
                          child: Column(
                            children: [
                              Image.asset("assets/images/send.png"),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(text: "Send money")
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //changeScreen(context, FundAccount());
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "Select funding method",
                                            size: 18,
                                            color: appColor,
                                            weight: FontWeight.bold,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: appColor),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(Icons.close,
                                                      color: appColor)))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  30),
                                                          topRight:
                                                              Radius.circular(
                                                                  30))),
                                              builder: (BuildContext ctx) {
                                                return SingleChildScrollView(
                                                    child: AddFundOnline());
                                              });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: "Card",
                                                size: 16,
                                                color: appColor,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              CustomText(
                                                text:
                                                    "Fund your account with your card details",
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
                                          log(myAccounts.toString());
                                          showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  30),
                                                          topRight:
                                                              Radius.circular(
                                                                  30))),
                                              builder: (BuildContext ctx) {
                                                return FundBankTransfer(
                                                    myAccounts: myAccounts);
                                              });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: "Bank Transfer",
                                                size: 16,
                                                color: appColor,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              CustomText(
                                                text:
                                                    "Fund your account through your other bank apps",
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
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              //border: Border.all(),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10.0,
                                    offset: Offset(2, 2),
                                    color: Colors.grey.withOpacity(0.2))
                              ]),
                          child: Column(
                            children: [
                              Image.asset("assets/images/fund.png"),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(text: "Fund account")
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              builder: (BuildContext ctx) {
                                return SingleChildScrollView(child: Withdraw());
                              });
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              //border: Border.all(),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10.0,
                                    offset: Offset(2, 2),
                                    color: Colors.grey.withOpacity(0.2))
                              ]),
                          child: Column(
                            children: [
                              Image.asset("assets/images/withdraw.png"),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(text: "Withdraw")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            //changeScreen(context, SavingsAndInvestment());
                          },
                          child: Container(
                            width: 120,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                //border: Border.all(),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10.0,
                                      offset: Offset(2, 2),
                                      color: Colors.grey.withOpacity(0.2))
                                ]),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Income",
                                      size: 16,
                                      color: Colors.black45,
                                      weight: FontWeight.bold,
                                    ),
                                    Image.asset(
                                      "assets/images/income.png",
                                      height: 30,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CustomText(
                                  text: "\u20A60",
                                  size: 18,
                                  color: Colors.green,
                                  weight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            //changeScreen(context, CurrentAccount());
                          },
                          child: Container(
                              padding: EdgeInsets.all(20),
                              width: 120,
                              decoration: BoxDecoration(
                                  //border: Border.all(),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10.0,
                                        offset: Offset(2, 2),
                                        color: Colors.grey.withOpacity(0.2))
                                  ]),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "Expenses",
                                        size: 16,
                                        color: Colors.black45,
                                        weight: FontWeight.bold,
                                      ),
                                      Image.asset(
                                        "assets/images/expenses.png",
                                        height: 30,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  CustomText(
                                    text: "\u20A60",
                                    size: 18,
                                    color: Colors.red,
                                    weight: FontWeight.bold,
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            //changeScreen(context, SavingsAndInvestment());
                          },
                          child: Container(
                              width: 120,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  //border: Border.all(),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10.0,
                                        offset: Offset(2, 2),
                                        color: Colors.grey.withOpacity(0.2))
                                  ]),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "Total Bills",
                                        size: 16,
                                        color: Colors.black45,
                                        weight: FontWeight.bold,
                                      ),
                                      Image.asset(
                                        "assets/images/total.png",
                                        height: 30,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  CustomText(
                                    text: "\u20A60",
                                    size: 18,
                                    color: Colors.black,
                                    weight: FontWeight.bold,
                                  )
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            //changeScreen(context, CurrentAccount());
                          },
                          child: Container(
                              padding: EdgeInsets.all(20),
                              width: 120,
                              decoration: BoxDecoration(
                                  //border: Border.all(),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10.0,
                                        offset: Offset(2, 2),
                                        color: Colors.grey.withOpacity(0.2))
                                  ]),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "Savings",
                                        size: 16,
                                        color: Colors.black45,
                                        weight: FontWeight.bold,
                                      ),
                                      Image.asset(
                                        "assets/images/money-giving.png",
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  CustomText(
                                    text: "\u20A60",
                                    size: 18,
                                    color: Colors.black,
                                    weight: FontWeight.bold,
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        //border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.0,
                              offset: Offset(2, 2),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: InkWell(
                      //contentPadding: EdgeInsets.all(0),
                      onTap: () {
                        changeScreen(context, BVNVerification());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.verified_user,
                            color: appColor,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Link BVN",
                                size: 16,
                                color: appColor,
                              ),
                              CustomText(
                                  text: "Link your BVN to setup your account")
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: appColor,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Transaction History",
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                      InkWell(
                        onTap: () {
                          changeScreen(
                              context,
                              TransactionHistory(
                                transactions: appProvider.transactions,
                                username: widget.username,
                              ));
                        },
                        child: CustomText(
                          text: "All>>",
                          size: 16,
                          weight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  appProvider.transactions.isNotEmpty
                      ? Flexible(
                          child: ListView.builder(
                              itemCount: appProvider.transactions.length <= 3
                                  ? appProvider.transactions.length
                                  : appProvider.transactions
                                      .take(3)
                                      .toList()
                                      .length,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 8),
                                      onTap: () async {},
                                      leading: appProvider.transactions[index]["SenderUsername"] ==
                                                  widget.username &&
                                              appProvider.transactions[index]
                                                      ["ReceiverUsername"] ==
                                                  widget.username
                                          ? Image.asset(
                                              "assets/images/fund.png")
                                          : appProvider.transactions[index]["SenderUsername"] ==
                                                  widget.username
                                              ? Image.asset(
                                                  "assets/images/send.png")
                                              : Image.asset(
                                                  "assets/images/fund.png"),
                                      title: CustomText(
                                        text: appProvider.transactions[index]
                                                        ["SenderUsername"] ==
                                                    widget.username &&
                                                appProvider.transactions[index]
                                                        ["ReceiverUsername"] ==
                                                    widget.username
                                            ? "Deposit"
                                            : appProvider.transactions[index]
                                                        ["SenderUsername"] !=
                                                    widget.username
                                                ? "Credit"
                                                : "Debit",
                                        size: 16,
                                        weight: FontWeight.bold,
                                      ),
                                      subtitle: CustomText(
                                          text: appProvider.transactions[index]
                                                          ["SenderUsername"] ==
                                                      widget.username &&
                                                  appProvider.transactions[index]
                                                          ["ReceiverUsername"] ==
                                                      widget.username
                                              ? "You funded your account with \u20A6${appProvider.transactions[index]["Amount"]} on ${appProvider.transactions[index]["Date"]}"
                                              : appProvider.transactions[index]["SenderUsername"] != widget.username
                                                  ? "Your account was credited with \u20A6${appProvider.transactions[index]["Amount"]} by ${appProvider.transactions[index]["SenderFullName"]} on ${appProvider.transactions[index]["Date"]}"
                                                  : "Your account was debited with \u20A6${appProvider.transactions[index]["Amount"]} to ${appProvider.transactions[index]["ReceiverFullName"]} on ${appProvider.transactions[index]["Date"]}"),
                                      trailing: CustomText(
                                        text: appProvider.transactions[index]
                                                        ["SenderUsername"] ==
                                                    widget.username &&
                                                appProvider.transactions[index]
                                                        ["ReceiverUsername"] ==
                                                    widget.username
                                            ? "+\u20A6${appProvider.transactions[index]["Amount"]}"
                                            : appProvider.transactions[index]
                                                        ["SenderUsername"] ==
                                                    widget.username
                                                ? "-\u20A6${appProvider.transactions[index]["Amount"]}"
                                                : "+\u20A6${appProvider.transactions[index]["Amount"]}",
                                        size: 16,
                                        weight: FontWeight.bold,
                                        color: appProvider.transactions[index]
                                                        ["SenderUsername"] ==
                                                    widget.username &&
                                                appProvider.transactions[index]
                                                        ["ReceiverUsername"] ==
                                                    widget.username
                                            ? Colors.green
                                            : appProvider.transactions[index]
                                                        ["SenderUsername"] ==
                                                    widget.username
                                                ? Colors.red
                                                : Colors.green,
                                      )),
                                );
                              }),
                        )
                      : Expanded(
                          child: Center(
                              child: CustomText(
                                  text: "No Transaction history to show"))),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
