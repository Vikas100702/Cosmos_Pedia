import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final double textSize;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final FontWeight? fontWeight;
  final Function onPressed;

  const CustomTextButton({
    super.key,
    required this.buttonText,
    required this.textSize,
    required this.buttonColor,
    required this.buttonTextColor,
    this.fontWeight,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: buttonTextColor,
          fontSize: textSize,
          fontWeight: fontWeight,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
