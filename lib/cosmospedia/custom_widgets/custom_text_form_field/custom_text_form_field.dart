import 'package:cosmos_pedia/cosmospedia/utils/constants.dart';
import 'package:cosmos_pedia/cosmospedia/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final double borderRadius;
  final double focusedBorderWidth;
  final double hintFontSize;
  final String hintText;
  final bool isObscure;
  final IconData? prefixIcon;
  final Color? iconColor;

  CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.borderRadius,
    required this.focusedBorderWidth,
    required this.hintText,
    required this.hintFontSize,
    required this.prefixIcon,
    required this.iconColor,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(5),
      ),
      child: TextFormField(
        controller: textEditingController,
        obscureText: isObscure,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: hintFontSize),
          border: InputBorder.none,
          filled: true,
          fillColor: whiteColor70,
          prefixIcon: Icon(
            prefixIcon,
            color: iconColor,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.height(1.5),
            horizontal: SizeConfig.width(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: focusedBorderWidth, color: whiteColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
