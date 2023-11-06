import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/controller/app_provider.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/change_password.dart';
import 'package:atfcl_fintech/screens/identity_verification2.dart';
import 'package:atfcl_fintech/screens/login.dart';
import 'package:atfcl_fintech/screens/support.dart';
import 'package:atfcl_fintech/screens/transactions/set_pin.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Spacer(),
                CustomText(
                  text: "Settings",
                  size: 18,
                  weight: FontWeight.bold,
                ),
                Spacer()
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: appColor,
            ),
            title: CustomText(
              text: "Verification with ID",
              color: appColor,
              weight: FontWeight.bold,
              size: 16,
            ),
            subtitle: CustomText(
              text: "Verify your account with your valid documents ",
              size: 14,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: appColor,
            ),
            onTap: () {
              changeScreen(context, IDVerification());
            },
          ),
          /* ListTile(
            leading: Icon(
              Icons.fingerprint,
              color: appColor,
            ),
            title: CustomText(
              text: "Use FingerPrint",
              color: appColor,
            ),
            trailing: Switch(
                activeColor: Colors.white,
                activeTrackColor: appColor,
                value: true,
                onChanged: (x) {}),
          ),*/
          /*ListTile(
            leading: Icon(
              Icons.wallet,
              color: appColor,
            ),
            title: CustomText(
              text: "Show Wallet Balance",
              color: appColor,
              weight: FontWeight.bold,
              size: 16,
            ),
            trailing: Switch(
                activeColor: Colors.white,
                activeTrackColor: appColor,
                value: true,
                onChanged: (x) {}),
          ),*/
          /* ListTile(
            leading: Icon(
              Icons.lock,
              color: appColor,
            ),
            title: CustomText(
              text: "Set Transaction Pin",
              color: appColor,
              weight: FontWeight.bold,
              size: 16,
            ),
            subtitle: CustomText(
              text: "Set up your 5-digit transaction pin",
              size: 14,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: appColor,
            ),
            onTap: () {
              changeScreen(context, SetPin());
            },
          ),*/
          ListTile(
            leading: Icon(
              Icons.visibility,
              color: appColor,
            ),
            title: CustomText(
              text: "Change Password",
              color: appColor,
              weight: FontWeight.bold,
              size: 16,
            ),
            subtitle: CustomText(
              text: "Change account password",
              size: 14,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: appColor,
            ),
            onTap: () {
              changeScreen(context, ChangePassword());
            },
          ),
          /*ListTile(
              leading: Icon(
                Icons.cake,
                color: appColor,
              ),
              title: CustomText(
                text: "Stick 'n' Earn ",
                color: appColor,
              ),
              subtitle: CustomText(
                text:
                    "Invite your friends with stickers and get \$1 per referral. ",
                size: 10,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: appColor,
              )),*/
          ListTile(
              leading: Icon(
                Icons.headphones,
                color: appColor,
              ),
              title: CustomText(
                text: "Support",
                color: appColor,
                weight: FontWeight.bold,
                size: 16,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: appColor,
              ),
              onTap: () {
                changeScreen(context, Support());
              }),
          ListTile(
              leading: Icon(
                Icons.logout,
                color: appColor,
              ),
              title: CustomText(
                text: "Log Out",
                color: appColor,
                weight: FontWeight.bold,
                size: 16,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: appColor,
              ),
              onTap: () {
                LocalStorage().setString("username", "");
                appProvider.removeUser();
                changeScreenRemoveUntill(context, Login());
              })
        ],
      ),
    );
  }
}
