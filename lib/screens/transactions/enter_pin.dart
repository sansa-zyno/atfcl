import 'package:atfcl_fintech/constants/app_colors.dart';
import 'package:atfcl_fintech/constants/app_strings.dart';
import 'package:atfcl_fintech/widgets/GradientButton/GradientButton.dart';
import 'package:atfcl_fintech/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class EnterPin extends StatefulWidget {
  Function callBack;
  EnterPin({required this.callBack});
  @override
  State<EnterPin> createState() => _EnterPinState();
}

class _EnterPinState extends State<EnterPin> {
  final FocusNode _pinPutFocusNode = FocusNode();
  TextEditingController pinController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
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
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: appColor,
                    ),
                  ),
                  Spacer(),
                  CustomText(
                    text: "Enter pin",
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomText(
                    text:
                        "Enter your 4-digit secure pin to approve this transaction ",
                    size: 16,
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 283,
                child: Pinput(
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
                height: 25,
              ),
              SizedBox(
                height: 100,
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : GradientButton(
                      title: "Continue",
                      textClr: Colors.white,
                      clrs: [appColor, appColor],
                      onpressed: () async {
                        widget.callBack();
                      }),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
