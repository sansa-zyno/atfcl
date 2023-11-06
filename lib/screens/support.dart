import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/bottom_navbar.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  bool faq1 = false;
  bool faq2 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  changeScreenReplacement(
                      context, BottomNavbar(username: "", pageIndex: 0));
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                ),
              ),
              Spacer(),
              CustomText(
                text: "Contact Support",
                size: 18,
                weight: FontWeight.bold,
              ),
              Spacer(),
              SizedBox(
                width: 30,
              ),
            ],
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
                      text: "Call or Chat us",
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.call,
                          color: appColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CustomText(
                          text: "08120875129",
                          size: 16,
                        )
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.call,
                          color: appColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CustomText(
                          text: "08034049175",
                          size: 16,
                        )
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.chat,
                          color: appColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CustomText(
                          text: "Live chat",
                          size: 16,
                        )
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: "Email us",
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.inbox,
                          color: appColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CustomText(
                          text: "contact@gmail.com",
                          size: 16,
                        )
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: "FAQ",
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ListTile(
                      title: CustomText(
                        text: "What is Assurance Trust used for ?",
                        size: 16,
                        color: faq1 ? appColor : Colors.black,
                      ),
                      subtitle: Visibility(
                        visible: faq1,
                        child: Text(
                            "Yoy can simply invest by choosing a package from our savings and investment section"),
                      ),
                      trailing: IconButton(
                        icon: Icon(faq1
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right),
                        onPressed: () {
                          faq1 = !faq1;
                          faq2 = false;
                          setState(() {});
                        },
                      ),
                    ),
                    Divider(
                      height: 30,
                    ),
                    ListTile(
                      title: CustomText(
                        text: "How do I save or invest in this platform ?",
                        color: faq2 ? appColor : Colors.black,
                        size: 16,
                      ),
                      subtitle: Visibility(
                        visible: faq2,
                        child: Text(
                            "Yoy can simply invest by choosing a package from our savings and investment section"),
                      ),
                      trailing: IconButton(
                        icon: Icon(faq2
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right),
                        onPressed: () {
                          faq1 = false;
                          faq2 = !faq2;
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      height: 300,
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
