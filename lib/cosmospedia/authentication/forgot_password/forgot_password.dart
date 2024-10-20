import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_icon_button/custom_icon_button.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:cosmos_pedia/cosmospedia/utils/constants.dart';
import 'package:cosmos_pedia/cosmospedia/utils/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void forgotPassword({
  required BuildContext context,
  required TextEditingController forgotPasswordController,
}) {
  final auth = FirebaseAuth.instance;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeConfig.devicePixelRatio(20),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(
            SizeConfig.devicePixelRatio(3),
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(
              SizeConfig.devicePixelRatio(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.devicePixelRatio(20),
                    ),
                  ),
                  CustomIconButton(
                    onPressedFunction: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.close,
                    iconColor: blackColor,
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.height(1),
              ),
              CustomTextFormField(
                textEditingController: forgotPasswordController,
                borderRadius: SizeConfig.devicePixelRatio(10),
                focusedBorderWidth: SizeConfig.devicePixelRatio(10),
                hintText: "Enter email",
                hintFontSize: SizeConfig.devicePixelRatio(15),
                prefixIcon: Icons.email,
                iconColor: blackColor38,
              ),
              SizedBox(
                height: SizeConfig.height(1),
              ),
              CustomElevatedButton(
                buttonText: "Send",
                textSize: SizeConfig.devicePixelRatio(12),
                maxHeight: SizeConfig.height(5),
                maxWidth: SizeConfig.width(5),
                buttonColor: whiteColor,
                buttonTextColor: blackColor,
                onPressed: () async {
                  await auth
                      .sendPasswordResetEmail(
                    email: forgotPasswordController.text,
                  )
                      .then(
                    (onValue) {
                      customSnackBar(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.devicePixelRatio(10),
                          ),
                        ),
                        behavior: SnackBarBehavior.floating,
                        text:
                            "We have send you the reset password link to your email id, Please check it",
                      );
                    },
                  ).onError((error, stackTrace) {
                    customSnackBar(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.devicePixelRatio(10),
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                      text: error.toString(),
                    );
                  });
                  Navigator.pop(context);
                  forgotPasswordController.clear();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
