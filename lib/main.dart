import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/controller/app_provider.dart';
import 'package:atfcl_fintech/controller/on_boarding_provider.dart';
import 'package:atfcl_fintech/screens/bottom_navbar.dart';
import 'package:atfcl_fintech/screens/login.dart';
import 'package:atfcl_fintech/screens/onboarding.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterStatusbarcolor.setStatusBarColor(appColor);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String? username;
  bool? onboarded;
  bool loading = false;

  getUserData() async {
    loading = true;
    setState(() {});
    username = await LocalStorage().getString("username");
    if (username == null) {
      username = "";
    }
    try {
      onboarded = await LocalStorage().getBool("onboarded");
    } catch (e) {
      onboarded = false;
    }
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardingProvider>(
      create: (context) => OnboardingProvider(),
      child: ChangeNotifierProvider<AppProvider>(
        create: (context) => AppProvider(),
        child: GetMaterialApp(
            title: 'Assurance Trust Finance Company Limited',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: GoogleFonts.nunitoTextTheme()),
            debugShowCheckedModeBanner: false,
            home: loading
                ? SafeArea(
                    child: Scaffold(
                        body: Center(
                            child: CircularProgressIndicator(
                      color: appColor,
                    ))),
                  )
                : username != ""
                    ? BottomNavbar(username: username!, pageIndex: 0)
                    : onboarded == true
                        ? Login()
                        : OnBoarding()),
      ),
    );
  }
}
