import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final double textSize;
  final double maxHeight;
  final double maxWidth;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final Function onPressed;

  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.textSize,
    required this.maxHeight,
    required this.maxWidth,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(maxWidth, maxHeight),
        backgroundColor: buttonColor,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: buttonTextColor,
          fontSize: textSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
