import 'package:flutter/material.dart';

customSnackBar({
  required BuildContext context,
  required ShapeBorder shape,
  required SnackBarBehavior behavior,
  required String text,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      shape: shape,
      behavior: behavior,
      content: Text(text)));
}
