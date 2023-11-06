import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FundBankTransfer extends StatefulWidget {
  final List myAccounts;
  FundBankTransfer({required this.myAccounts, super.key});

  @override
  State<FundBankTransfer> createState() => _FundBankTransferState();
}

class _FundBankTransferState extends State<FundBankTransfer> {
  bool showAccounts = false;
  int idx = 0;
  @override
  Widget build(BuildContext context) {
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
                text: "Account Details",
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
          CustomText(
            text: "Make payment into the account below: ",
            size: 16,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Account To Fund",
                  size: 16,
                  color: appColor,
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showAccounts = !showAccounts;
                    setState(() {});
                  },
                  child: CustomText(
                    text: widget.myAccounts.isNotEmpty
                        ? "${widget.myAccounts[idx]["AccountNumber"]}"
                        : "",
                    size: 16,
                  ),
                ),
                Visibility(
                    visible: showAccounts,
                    child: Card(
                      margin: EdgeInsets.only(top: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: widget.myAccounts.length,
                                itemBuilder: (ctx, index) => InkWell(
                                      onTap: () {
                                        idx = index;
                                        showAccounts = false;
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
                                                widget.myAccounts[idx]
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
                    ))
              ],
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
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Bank Name",
                  size: 16,
                  color: appColor,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: widget.myAccounts[idx]["BankName"],
                  size: 16,
                )
              ],
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
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Account Number",
                  size: 16,
                  color: appColor,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: widget.myAccounts.isEmpty
                      ? "XXXXXXXXXX"
                      : widget.myAccounts[idx]["AccountNumber"],
                  size: 16,
                )
              ],
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
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Account Name",
                  size: 16,
                  color: appColor,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: widget.myAccounts[idx]["AccountName"],
                  size: 16,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
