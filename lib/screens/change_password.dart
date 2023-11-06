import 'dart:convert';
import 'package:achievement_view/achievement_view.dart';
import 'package:atfcl_fintech/constants/api.dart';
import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/modals/alert.dart';
import 'package:atfcl_fintech/services/http.service.dart';
import 'package:atfcl_fintech/services/local_storage.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPassword2Controller = TextEditingController();
  bool obscurePass1 = true;
  bool obscurePass2 = true;
  bool obscurePass3 = true;
  bool loading = false;
  String? username;

  getUserName() async {
    username = await LocalStorage().getString("username");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                  Spacer(),
                  CustomText(
                    text: "Change Password",
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Old Password",
                size: 16,
                color: appColor,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 8,
              ),
              CurvedTextField(
                  hint: "Old password",
                  obscureText: obscurePass1,
                  controller: oldPasswordController,
                  suffixIcon: IconButton(
                      onPressed: () {
                        obscurePass1 = !obscurePass1;
                        setState(() {});
                      },
                      icon: !obscurePass1
                          ? Icon(
                              Icons.visibility_off,
                              color: appColor,
                            )
                          : Icon(
                              Icons.visibility,
                              color: appColor,
                            ))),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: "New password",
                size: 16,
                color: appColor,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 8,
              ),
              CurvedTextField(
                  hint: "New password",
                  obscureText: obscurePass2,
                  controller: newPasswordController,
                  suffixIcon: IconButton(
                      onPressed: () {
                        obscurePass2 = !obscurePass2;
                        setState(() {});
                      },
                      icon: !obscurePass2
                          ? Icon(
                              Icons.visibility_off,
                              color: appColor,
                            )
                          : Icon(
                              Icons.visibility,
                              color: appColor,
                            ))),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Re-enter New Password",
                size: 16,
                color: appColor,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 8,
              ),
              CurvedTextField(
                  hint: "Re-enter password",
                  obscureText: obscurePass3,
                  controller: newPassword2Controller,
                  suffixIcon: IconButton(
                      onPressed: () {
                        obscurePass3 = !obscurePass3;
                        setState(() {});
                      },
                      icon: !obscurePass3
                          ? Icon(
                              Icons.visibility_off,
                              color: appColor,
                            )
                          : Icon(
                              Icons.visibility,
                              color: appColor,
                            ))),
              SizedBox(
                height: 50,
              ),
              loading
                  ? Center(child: CircularProgressIndicator())
                  : InkWell(
                      onTap: () {
                        update();
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(0xff12246E),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Submit",
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  update() async {
    loading = true;
    setState(() {});
    Response apiResponse = await HttpService.post(Api.changePassword, {
      "username": username,
      "oldpassword": oldPasswordController.text,
      "newpassword": newPasswordController.text,
      "newpassword2": newPassword2Controller.text,
    });
    final result = jsonDecode(apiResponse.data);
    print(result);
    if (result["Status"] == "succcess") {
      AchievementView(
        color: Color(0xFF072A6C),
        icon: Image.asset("assets/images/hand_up.png"),
        title: "Success!",
        elevation: 20,
        subTitle: "Password reset successfully",
        isCircle: true,
      ).show(context);
      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (ctx) => ShowDialogWidget(
                titleText: result["Report"],
                subText: "Your input fields could not be updated",
              ));
    }
    loading = false;
    setState(() {});
  }
}
