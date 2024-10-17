import 'package:cosmos_pedia/cosmospedia/authentication/screen/sign_up_screen.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_text_button/custom_text_button.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:cosmos_pedia/cosmospedia/utils/constants.dart';
import 'package:cosmos_pedia/cosmospedia/utils/size_config.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.height(45),
                  child: Image.asset("assets/logo.jpeg"),
                ),
                SizedBox(
                  height: SizeConfig.height(2.5),
                ),
                CustomTextFormField(
                  textEditingController: emailController,
                  borderRadius: SizeConfig.devicePixelRatio(30),
                  focusedBorderWidth: SizeConfig.width(1),
                  hintText: "Enter your email...",
                  hintFontSize: SizeConfig.devicePixelRatio(15),
                  prefixIcon: Icons.email,
                ),
                SizedBox(
                  height: SizeConfig.height(2.5),
                ),
                CustomTextFormField(
                  textEditingController: passwordController,
                  borderRadius: SizeConfig.devicePixelRatio(30),
                  focusedBorderWidth: SizeConfig.width(1),
                  hintText: "Enter your password...",
                  hintFontSize: SizeConfig.devicePixelRatio(15),
                  prefixIcon: Icons.lock,
                  isObscure: true,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: SizeConfig.width(10)),
                  child: Align(
                    alignment: Alignment.centerRight,
                    /*child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                        fontSize: SizeConfig.devicePixelRatio(15),
                      ),
                    ),*/
                    child: CustomTextButton(
                      buttonText: "Forgot Password?",
                      textSize: SizeConfig.devicePixelRatio(15),
                      buttonColor: transparent,
                      buttonTextColor: whiteColor,
                      fontWeight: FontWeight.bold,
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height(2.5),
                ),
                CustomElevatedButton(
                  buttonText: "Sign in",
                  textSize: SizeConfig.devicePixelRatio(15),
                  maxHeight: SizeConfig.height(5),
                  maxWidth: SizeConfig.width(90),
                  buttonColor: whiteColor,
                  buttonTextColor: blackColor,
                  onPressed: () {},
                ),
                SizedBox(
                  height: SizeConfig.height(2.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: whiteColor70,
                        fontSize: SizeConfig.devicePixelRatio(15),
                      ),
                    ),
                    CustomTextButton(
                      buttonText: "Signup",
                      textSize: SizeConfig.devicePixelRatio(15),
                      buttonColor: transparent,
                      buttonTextColor: whiteColor,
                      fontWeight: FontWeight.bold,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
