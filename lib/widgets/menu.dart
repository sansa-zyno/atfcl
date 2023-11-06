import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/constants/app_strings.dart';
import 'package:atfcl_fintech/controller/app_provider.dart';
import 'package:atfcl_fintech/helpers/common.dart';
import 'package:atfcl_fintech/screens/agent_fee.dart';
import 'package:atfcl_fintech/screens/bottom_navbar.dart';
import 'package:atfcl_fintech/screens/create_account.dart';
import 'package:atfcl_fintech/screens/investment/fixed_deposit_list.dart';
import 'package:atfcl_fintech/screens/login.dart';
import 'package:atfcl_fintech/screens/profile.dart';
import 'package:atfcl_fintech/screens/savings/savings_list.dart';
import 'package:atfcl_fintech/screens/transactions/transaction_history.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  final String username;
  Menu({required this.username});
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getUserData();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: appColor,
                  border: Border(top: BorderSide(color: Colors.blueGrey))),
              currentAccountPicture: CircularProfileAvatar(
                "",
                backgroundColor: Color(0xffDCf0EF),
                initialsText: Text(
                  "+",
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w900,
                      fontSize: 21,
                      color: Colors.white),
                ),
                borderWidth: 2,
                elevation: 10,
                radius: 50,
                onTap: () {},
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
              accountName: Text(widget.username,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white)),
              accountEmail: Container(
                height: 8,
              ) /*Text(
                  "${appProvider.profileDetails != null ? appProvider.profileDetails!["email"] : ""}",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white))*/
              ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(15),
              children: [
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: appColor,
                  ),
                  title: Text("Dashboard",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                          child: BottomNavbar(
                              username: widget.username, pageIndex: 0)),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: appColor,
                  ),
                  title: Text("Create Accounts",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  onTap: () {
                    changeScreen(context, CreateAccount());
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.support,
                    color: appColor,
                  ),
                  title: Text("Apply For Agents",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  onTap: () {
                    changeScreen(context, AgentFee());
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.calculate,
                    color: appColor,
                  ),
                  title: Text("Investment",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  onTap: () {
                    changeScreen(context, FixedDepositList());
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.save,
                    color: appColor,
                  ),
                  title: Text("Savings",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  onTap: () {
                    changeScreen(context, SavingsList());
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.details,
                    color: appColor,
                  ),
                  title: Text("Profile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  onTap: () {
                    changeScreen(context, Profile());
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.history,
                    color: appColor,
                  ),
                  title: Text("Transactions",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  onTap: () {
                    changeScreen(
                        context,
                        TransactionHistory(
                            transactions: appProvider.transactions,
                            username: widget.username));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.card_membership,
                    color: appColor,
                  ),
                  title: Text("My Cards",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.money,
                    color: appColor,
                  ),
                  title: Text("Loans",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                          child: BottomNavbar(
                              username: widget.username, pageIndex: 1)),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: appColor,
                  ),
                  title: Text("Logout",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  onTap: () {
                    //LocalStorage().clearPref();
                    //AppbackgroundService().stopBg();
                    LocalStorage().setString("username", "");
                    appProvider.removeUser();
                    changeScreenRemoveUntill(context, Login());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
