import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function? onPressedFunction;
  final IconData? icon;
  final Color? iconColor;

  const CustomIconButton({
    super.key,
    required this.onPressedFunction,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressedFunction!();
      },
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
