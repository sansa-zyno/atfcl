import 'dart:developer';

import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LoanTermsOfUse extends StatefulWidget {
  const LoanTermsOfUse({super.key});

  @override
  State<LoanTermsOfUse> createState() => _LoanTermsOfUseState();
}

class _LoanTermsOfUseState extends State<LoanTermsOfUse> {
  List<Map>? contacts;
  Future<Position?> getLocation() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getContacts() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus status = await Permission.contacts.request();
      if (status == PermissionStatus.granted) {
        try {
          List<Contact> foundContacts =
              await ContactsService.getContacts(withThumbnails: false);
          log("done loading contacts" + foundContacts.length.toString());
          final list = foundContacts.toList();
          list.sort((a, b) => a.displayName!.compareTo(b.displayName!));
          contacts = [];
          for (int i = 0; i < list.length; i++) {
            if (list[i].phones!.isNotEmpty) {
              contacts!.add({
                "name": list[i].displayName,
                "number": list[i].phones![0].value!.replaceAll(" ", "")
              });
            }
          }
          log(contacts.toString());
        } catch (e) {
          log(e.toString());
        }
      }
    } else {
      try {
        List<Contact> foundContacts =
            await ContactsService.getContacts(withThumbnails: false);
        debugPrint("done loading contacts" + foundContacts.length.toString());
        final list = foundContacts.toList();
        list.sort((a, b) => a.displayName!.compareTo(b.displayName!));
        contacts = [];
        for (int i = 0; i < list.length; i++) {
          if (list[i].phones!.isNotEmpty) {
            contacts!.add({
              "name": list[i].displayName,
              "number": list[i].phones![0].value!.replaceAll(" ", "")
            });
          }
        }
        log(contacts.toString());
      } catch (e) {
        log(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                Spacer(),
                CustomText(
                  text: "Terms Of Use",
                  size: 18,
                  weight: FontWeight.bold,
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "If you pay on time...",
                        size: 16,
                        color: appColor,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.money,
                              color: appColor,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Higher amounts",
                                  size: 16,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomText(text: "Up to #1,000,000")
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.card_giftcard,
                              color: appColor,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Instalments",
                                  size: 16,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomText(text: "Spread your payments")
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "If you pay late",
                        size: 16,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.card_membership,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Automatic debit",
                                  size: 16,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomText(text: "On your bank account")
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.interests,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Interest for overdue amount",
                                    size: 16,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  CustomText(
                                      text:
                                          "If your payment is delayed, a penalty fee will be charged in accordance with the regulatory guidelines set by the Central Bank of Nigeria (CBN)")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Credit bureaus",
                                  size: 16,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomText(text: "Defaulters are reported")
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "Read our terms of use and privacy policy online",
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text:
                            "Loan amounts range between #1,500 to #1,000,000 with repayment periods from 61 days to 18 months at monthly interest rates that range from 2.5% to 30% (APRs from 30% to 260%)",
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              fillColor: MaterialStateProperty.all(appColor),
                              visualDensity: VisualDensity(horizontal: -4),
                              checkColor: Colors.white,
                              value: true,
                              onChanged: (x) {}),
                          CustomText(
                            text: "I agree to the terms and privacy policy?",
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GradientButton(
                        title: "Confirm",
                        clrs: [appColor, appColor],
                        onpressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  insetPadding: EdgeInsets.all(15),
                                  contentPadding: EdgeInsets.all(30),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text:
                                            "Allow us to collect and sync your:",
                                        size: 16,
                                        weight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      CustomText(
                                          text:
                                              "- Geolocation to make sure you are in Nigeria"),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      CustomText(
                                          text:
                                              "- Contact list to perform a better risk assesment"),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      CustomText(
                                          text:
                                              "It will help us make the right loan offers to you.\nThis data will be collected and stored securely by ATFCL.\nThis data will not be sold but may be shared with credit scoring institutions"),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GradientButton(
                                            title: "Disagree",
                                            clrs: [appColor2, appColor2],
                                            onpressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          GradientButton(
                                            title: "Give access",
                                            clrs: [Colors.green, Colors.green],
                                            onpressed: () {
                                              getLocation().then((position) =>
                                                  {getContacts()});
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  )));
                        },
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
