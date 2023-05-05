import 'package:flutter/material.dart';
import 'package:seenit/theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final inputcolor;
  final bordercolor;
  final String hintText;
  final int? maxLines;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.inputcolor,
      this.bordercolor,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(),
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            borderSide: BorderSide(
              color: Pallete.cyan,
              width: 2,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            borderSide: BorderSide(
              color: Pallete.cyan,
              width: 2,
            )),
        hintText: hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.w300),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }

        return null;
      },
    );
  }
}
