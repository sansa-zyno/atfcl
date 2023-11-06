import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int idx = -1;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                    Icons.arrow_back_ios_new,
                    color: appColor,
                    size: 20,
                  ),
                ),
                Spacer(),
                CustomText(
                  text: "Notifications",
                  size: 18,
                  weight: FontWeight.bold,
                ),
                Spacer(),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            Divider(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    bool isSameDate = true;
                    DateTime dt = DateTime.parse("1970-12-0$index");
                    if (index == 0) {
                      isSameDate = false;
                    } else {
                      DateTime dte = DateTime.parse(
                          "1970-12-0${index - 1}"); //date of prev item
                      isSameDate =
                          dt.compareTo(dte) == 0 ? true : false; //compare dates
                    }
                    if (index == 0 || !(isSameDate)) {
                      DateTime dt = DateTime.parse("1970-12-0$index");
                      DateTime dateNow = DateTime.parse(
                          DateTime.now().toString().substring(0, 10));
                      DateTime dtTime = DateTime.parse("1970-12-0$index");
                      String time = formatDate(dtTime, [hh, ':', nn, ' ', am]);

                      String date = dt.compareTo(dateNow) == 0
                          ? "Today"
                          : "${dt.year} ${dt.month} ${dt.day}" ==
                                  "${dateNow.year} ${dateNow.month} ${(dateNow.day) - 1}"
                              ? "Yesterday"
                              : formatDate(dt, [M, ' ', dd, ', ', yyyy]);
                      return Column(
                        children: [
                          SizedBox(height: 8),
                          Center(
                            child: Text(
                              date,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 15),
                          Card(
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 8),
                              title: CustomText(
                                text: "Transfer Successful",
                                size: 16,
                                weight: FontWeight.bold,
                              ),
                              trailing: CustomText(
                                text: "View Details",
                                color: appColor2,
                                weight: FontWeight.bold,
                              ),
                              subtitle: CustomText(
                                  text:
                                      "Your transfer of N500.00 to bank account “FARUKU UMAR(4568543)” has been..."),
                            ),
                          )
                        ],
                      );
                    } else {
                      DateTime dtTime = DateTime.parse("1970-12-0$index");
                      String time = formatDate(dtTime, [hh, ':', nn, ' ', am]);
                      return Card(
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                          title: CustomText(
                            text: "Transfer Successful",
                            size: 16,
                            weight: FontWeight.bold,
                          ),
                          trailing: CustomText(
                            text: "View Details",
                            color: appColor2,
                            weight: FontWeight.bold,
                          ),
                          subtitle: CustomText(
                              text:
                                  "Your transfer of N500.00 to bank account “FARUKU UMAR(4568543)” has been..."),
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
