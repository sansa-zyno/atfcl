/*import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/constants/app_images.dart';
import 'package:atfcl_fintech/constants/app_strings.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewVirtualCard extends StatefulWidget {
  const NewVirtualCard({Key? key}) : super(key: key);

  @override
  State<NewVirtualCard> createState() => _NewVirtualCardState();
}

class _NewVirtualCardState extends State<NewVirtualCard> {
  bool expanded = false;
  String dob = "";
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Stack(
        children: [
          Positioned(
              top: 0, left: 15, child: Image.asset(heart_red_2, width: 70)),
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: titleBarOffset,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: appColor,
                          size: 20,
                        ),
                        Spacer(),
                        CustomText(
                          text: "Create Virtual Card",
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Spacer(),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text:
                              "We’ll need some details to create your virtual card",
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //image: DecorationImage(image: AssetImage(stickers)),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [appColor, appColor],
                          stops: [0.02, 0.2]),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          CustomText(
                            text: "Full Name",
                            color: appColor,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CurvedTextField(
                            hint: "",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomText(
                            text: "Nickname",
                            color: appColor,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CurvedTextField(
                            hint: "",
                            //controller: name,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 283,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Date Of Birth",
                                      color: appColor,
                                      weight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        DateTime? date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2020),
                                            lastDate: DateTime.now());
                                        if (date != null) {
                                          dob =
                                              "${date.year}-${date.month}-${date.day}";
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 58,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  blurRadius: 10,
                                                  offset: Offset(2, 2))
                                            ]),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(Icons.date_range),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            CustomText(text: dob)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Sex",
                                      color: appColor,
                                      weight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 58,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                blurRadius: 10,
                                                offset: Offset(2, 2))
                                          ]),
                                      child: ExpansionTile(
                                        expandedAlignment: Alignment.centerLeft,
                                        expandedCrossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        onExpansionChanged: (x) {
                                          expanded = x;
                                          setState(() {});
                                        },
                                        title: Text("",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14)),
                                        trailing: Icon(Icons.arrow_drop_down,
                                            color: appColor),
                                        children: [],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          GradientButton(
                            title: "Create",
                            textClr: Colors.white,
                            clrs: [Color(0xffDAAFFF), Color(0xffDAAFFF)],
                            onpressed: () {},
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}*/
