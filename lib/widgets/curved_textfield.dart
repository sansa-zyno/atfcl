import 'package:flutter/material.dart';

class CurvedTextField extends StatelessWidget {
  final String? hint;
  TextEditingController? controller;
  TextInputType? type;
  bool? obscureText;
  String? Function(String?)? validator;
  Widget? suffixIcon;

  CurvedTextField(
      {this.controller,
      this.hint,
      this.obscureText,
      this.type,
      this.validator,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 283,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type ?? TextInputType.text,
        obscureText: obscureText ?? false,
        decoration: new InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            alignLabelWithHint: false,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintText: hint ?? '',
            labelStyle: TextStyle(
              fontFamily: "Nunito",
            ),
            hintStyle: TextStyle(fontFamily: "Nunito", color: Colors.black45),
            suffixIcon: suffixIcon ?? null),
        validator: validator ?? null,
      ),
    );
  }
}
