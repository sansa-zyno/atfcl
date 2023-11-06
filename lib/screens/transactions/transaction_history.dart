import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class TransactionHistory extends StatefulWidget {
  final List transactions;
  final String username;
  TransactionHistory({required this.transactions, required this.username});
  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  List transactions = [];
  getTransactionHistory(String token) async {
    /*Response response = await HttpService.getRequest(Api.transactionHistory,
        bearerToken: true, accessToken: token);
    Map result = jsonDecode(response.body);
    if (result["status"]) {
      transactionHistory = result["data"];
      log(transactionHistory.toString());
      setState(() {});
    } else {
      //transactionHistory = [];
      //setState(() {});
    }*/
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transactions = widget.transactions;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  Spacer(),
                  CustomText(
                    text: "Transaction History",
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                  Spacer()
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            transactions.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: transactions.length,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 0,
                            child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 8),
                                onTap: () async {},
                                leading: transactions[index]
                                                ["SenderUsername"] ==
                                            widget.username &&
                                        transactions[index]
                                                ["ReceiverUsername"] ==
                                            widget.username
                                    ? Image.asset("assets/images/fund.png")
                                    : transactions[index]["SenderUsername"] ==
                                            widget.username
                                        ? Image.asset("assets/images/send.png")
                                        : Image.asset("assets/images/fund.png"),
                                title: CustomText(
                                  text: transactions[index]["SenderUsername"] ==
                                              widget.username &&
                                          transactions[index]
                                                  ["ReceiverUsername"] ==
                                              widget.username
                                      ? "Deposit"
                                      : transactions[index]["SenderUsername"] !=
                                              widget.username
                                          ? "Credit"
                                          : "Debit",
                                  size: 16,
                                  weight: FontWeight.bold,
                                ),
                                subtitle: CustomText(
                                    text: transactions[index]
                                                    ["SenderUsername"] ==
                                                widget.username &&
                                            transactions[index]
                                                    ["ReceiverUsername"] ==
                                                widget.username
                                        ? "You funded your account with \u20A6${transactions[index]["Amount"]} on ${transactions[index]["Date"]}"
                                        : transactions[index]
                                                    ["SenderUsername"] !=
                                                widget.username
                                            ? "Your account was credited with \u20A6${transactions[index]["Amount"]} by ${transactions[index]["SenderFullName"]} on ${transactions[index]["Date"]}"
                                            : "Your account was debited with \u20A6${transactions[index]["Amount"]} to ${transactions[index]["ReceiverFullName"]} on ${transactions[index]["Date"]}"),
                                trailing: CustomText(
                                  text: transactions[index]["SenderUsername"] ==
                                              widget.username &&
                                          transactions[index]
                                                  ["ReceiverUsername"] ==
                                              widget.username
                                      ? "+\u20A6${transactions[index]["Amount"]}"
                                      : transactions[index]["SenderUsername"] ==
                                              widget.username
                                          ? "-\u20A6${transactions[index]["Amount"]}"
                                          : "+\u20A6${transactions[index]["Amount"]}",
                                  size: 16,
                                  weight: FontWeight.bold,
                                  color: transactions[index]
                                                  ["SenderUsername"] ==
                                              widget.username &&
                                          transactions[index]
                                                  ["ReceiverUsername"] ==
                                              widget.username
                                      ? Colors.green
                                      : transactions[index]["SenderUsername"] ==
                                              widget.username
                                          ? Colors.red
                                          : Colors.green,
                                )),
                          );
                        }),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height - 150,
                    alignment: Alignment.center,
                    child: CustomText(text: "No Transaction history to show"))
          ],
        ),
      ),
    );
  }
}
