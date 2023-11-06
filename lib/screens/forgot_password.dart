import 'dart:convert';
import 'package:atfcl_fintech/constants/api.dart';
import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/modals/alert.dart';
import 'package:atfcl_fintech/services/http.service.dart';
import 'package:atfcl_fintech/widgets/curved_textfield.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool loading = false;
  TextEditingController emailController = TextEditingController();
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
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  Spacer(),
                  CustomText(
                    text: "Forgot Password",
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
                text:
                    "Kindly enter your email address. We’ll send a link for you to reset your password.",
                size: 16,
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Email",
                size: 16,
                color: appColor,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 8,
              ),
              CurvedTextField(
                hint: "Email",
                controller: emailController,
              ),
              SizedBox(
                height: 50,
              ),
              loading
                  ? Center(child: CircularProgressIndicator())
                  : InkWell(
                      onTap: () {
                        reset();
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

  reset() async {
    loading = true;
    setState(() {});
    final res = await HttpService.post(
        Api.forgotPassword, {"email": emailController.text});
    final result = jsonDecode(res.data);
    print(result);
    if (result["Status"] == "succcess") {
      showDialog(
          context: context,
          builder: (ctx) => ShowDialogWidget(
                image: "assets/images/hand_up.png",
                titleText: result["Report"],
                subText: "",
              ));
    } else {
      showDialog(
          context: context,
          builder: (ctx) => ShowDialogWidget(
                titleText: result["Report"],
                subText:
                    "Please enter the email address associated with your account",
              ));
    }
    loading = false;
    setState(() {});
  }
}
