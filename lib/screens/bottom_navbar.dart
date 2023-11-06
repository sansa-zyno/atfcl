import 'dart:async';
import 'dart:io';
import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/controller/app_provider.dart';
import 'package:atfcl_fintech/screens/home.dart';
import 'package:atfcl_fintech/screens/loan/loan_getstarted.dart';
import 'package:atfcl_fintech/screens/support.dart';
import 'package:atfcl_fintech/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';

class BottomNavbar extends StatefulWidget {
  String username;
  int pageIndex = 0;
  BottomNavbar({Key? key, required this.username, required this.pageIndex})
      : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  late int pageIndex;
  late Widget _showPage;
  late Home _home;
  late LoanGetStarted _loan;
  late Support _support;
  late Settings _settings;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamSubscription? listener;

  //navbar
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _home;
      case 1:
        return _loan;
      case 2:
        return _support;
      case 3:
        return _settings;

      default:
        return new Container(
            child: new Center(
          child: new Text(
            //'No Page found by page thrower',
            "This screen is still under development",
            style: new TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ));
    }
  }

  /* bg() async {
    await Future.delayed(Duration(seconds: 30), () async {
      await AppbackgroundService().startBg();
    });
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.getImage(widget.username);
    appProvider.getProFileDetails(widget.username);
    _home = Home(username: widget.username);
    _loan = LoanGetStarted();
    _support = Support();
    _settings = Settings();
    pageIndex = widget.pageIndex;
    _showPage = _pageChooser(pageIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    listener!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        //backgroundColor: Color(0xffCDD8F0),
        //backgroundColor: Color(0xff0e6dfd),
        //drawer: Menu(),
        body: UpgradeAlert(
            upgrader: Upgrader(
              dialogStyle: Platform.isIOS
                  ? UpgradeDialogStyle.cupertino
                  : UpgradeDialogStyle.material,
            ),
            child: _showPage),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.shifting,
                elevation: 10,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    activeIcon: Image.asset(
                      "assets/images/home.png",
                      color: appColor,
                    ),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.credit_card),
                    activeIcon: Image.asset(
                      "assets/images/credit-card.png",
                      color: appColor,
                    ),
                    label: 'Loan',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.headphones),
                    activeIcon: Image.asset(
                      "assets/images/headset.png",
                      color: appColor,
                    ),
                    label: 'Support',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    activeIcon: Image.asset(
                      "assets/images/cog-outline.png",
                      color: appColor,
                    ),
                    label: 'Settings',
                  )
                ],
                showSelectedLabels: true,
                showUnselectedLabels: true,
                currentIndex: pageIndex,
                selectedItemColor: Color(0xff12246E),
                unselectedItemColor: Colors.black87,
                unselectedFontSize: 14,
                selectedFontSize: 14,
                onTap: (int tappedIndex) {
                  setState(() {
                    pageIndex = tappedIndex;
                    _showPage = _pageChooser(pageIndex);
                  });
                }),
          ),
        ),
      ),
    );
  }
}
