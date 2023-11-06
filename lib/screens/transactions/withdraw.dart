import 'dart:convert';
import 'package:atfcl_fintech/constants/api.dart';
import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/style.dart';
import 'package:atfcl_fintech/services/http.service.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  int idx = -1;
  bool showAccts = false;
  String selectedAccountNo = "";
  TextEditingController amountController = TextEditingController();
  TextEditingController withdrawToAccountNo = TextEditingController();
  bool loading = false;

  List myAccounts = [];

  Future getUsername() async {
    String username = await LocalStorage().getString("username");
    return username;
  }

  getMyAccounts(String username) async {
    Response res =
        await HttpService.post(Api.userAccounts, {"username": username});
    myAccounts = jsonDecode(res.data);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername().then((username) => getMyAccounts(username));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      text: "Withdraw From",
                      color: appColor,
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        showAccts = !showAccts;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            CustomText(
                              text: selectedAccountNo != ""
                                  ? selectedAccountNo
                                  : "Choose Account",
                              size: 16,
                              color: selectedAccountNo == ""
                                  ? Colors.black45
                                  : black,
                            )
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                        visible: showAccts,
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: myAccounts.length,
                                    itemBuilder: (ctx, index) => InkWell(
                                          onTap: () {
                                            idx = index;
                                            showAccts = false;
                                            selectedAccountNo =
                                                myAccounts[index]
                                                    ["AccountNumber"];
                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: idx == index
                                                    ? appColor
                                                    : Colors.transparent),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                    myAccounts[index]
                                                        ["AccountNumber"],
                                                    style: TextStyle(
                                                        color: idx == index
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 16)),
                                              ],
                                            ),
                                          ),
                                        )),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        width: 283,
                        child: CustomText(
                          text: "To",
                          color: appColor,
                          size: 16,
                          weight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    CurvedTextField(
                      hint: "Enter IBAN",
                      controller: withdrawToAccountNo,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        width: 283,
                        child: CustomText(
                          text: "Amount",
                          color: appColor,
                          size: 16,
                          weight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    CurvedTextField(
                      hint: "\u20A6  100",
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    loading
                        ? Center(child: CircularProgressIndicator())
                        : GradientButton(
                            title: "Withdraw",
                            clrs: [appColor, appColor],
                            onpressed: () async {})
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
