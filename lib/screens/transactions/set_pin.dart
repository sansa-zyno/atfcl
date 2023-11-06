import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class SetPin extends StatefulWidget {
  const SetPin({Key? key}) : super(key: key);

  @override
  State<SetPin> createState() => _SetPinState();
}

class _SetPinState extends State<SetPin> {
  final FocusNode _pinPutFocusNode = FocusNode();
  TextEditingController pinController = TextEditingController();
  bool isLoading = false;
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
                  text: "Set Transaction Pin",
                  weight: FontWeight.bold,
                  size: 18,
                ),
                Spacer(),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    "assets/images/setpin_padlock.png",
                    color: appColor,
                    height: 100,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text:
                        "Choose a secure 4-digit PIN.\n Don’t share this Pin with anyone!",
                    size: 12,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Pinput(
                      onChanged: (x) {},
                      length: 4,
                      defaultPinTheme: PinTheme(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(8))),
                      onSubmitted: (String pin) => {},
                      focusNode: _pinPutFocusNode,
                      controller: pinController,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : GradientButton(
                          title: "Save",
                          textClr: Colors.white,
                          clrs: [appColor, appColor],
                          onpressed: () {
                            setPin();
                          },
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  setPin() async {
    /*isLoading = true;
    setState(() {});
    Response response = await HttpService.postRequest(
        Api.setPin,
        {
          "current_pin": userController.getCurrentUser.antpayPin,
          "pin": pinController.text,
          "pin_confirmation": pinController.text
        },
        bearerToken: true,
        accessToken: appProvider.token);

    if (response.statusCode == 200) {
      Map res = jsonDecode(response.body);
      log(res.toString());
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userController.getCurrentUser.uid)
          .update({"antpayPin": pinController.text});
      isLoading = false;
      setState(() {});
      AchievementView(
        context,
        color: Colors.green,
        icon: Icon(
          FontAwesomeIcons.check,
          color: Colors.white,
        ),
        title: "Successfull !",
        elevation: 20,
        subTitle: res["status"],
        isCircle: true,
      ).show();
      userController.getCurrentUserInfo();
      Navigator.pop(context);
    } else {
      isLoading = false;
      setState(() {});
      Map res = jsonDecode(response.body);
      log(res.toString());
      Get.defaultDialog(
        title: "Error",
        titleStyle: TextStyle(color: Colors.red),
        middleText: res["message"],
      );
    }*/
  }
}
