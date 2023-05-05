import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  //text, onTAp is required, color not required, if not provided, it will take default themem color(orangeish)
  final Color? color;
  final VoidCallback onTap;
  const CustomPrimaryButton(
      {super.key, this.color, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //cant use const Text(text) as value of text won't be known at compile time, it will only be known at runtime

      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: color,
        minimumSize: const Size(
          290,
          50,
        ),
      ),
      child: Text(
        text,
        //if color of button not provided(null), then set color for text as white otherwise set color of text as black
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
