import 'package:cosmos_pedia/cosmospedia/authentication/screen/sign_in_screen.dart';
import 'package:cosmos_pedia/cosmospedia/authentication/services/auth_services.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_text_button/custom_text_button.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:cosmos_pedia/cosmospedia/utils/constants.dart';
import 'package:cosmos_pedia/cosmospedia/utils/size_config.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void signUp() async {
    // set is loading to true.
    setState(() {
      isLoading = true;
    });
    // signup user using our authServices
    String res = await AuthServices().signUp(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text);
    // if string return is success, user has been creaded and navigate to next screen other witse show error.
    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      customSnackBar(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.devicePixelRatio(10),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          text: res);
      //navigate to the next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      // show error
      customSnackBar(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.devicePixelRatio(10),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          text: res);
    }
  }

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
                  textEditingController: nameController,
                  borderRadius: SizeConfig.devicePixelRatio(30),
                  focusedBorderWidth: SizeConfig.width(1),
                  hintText: "Enter your name...",
                  hintFontSize: SizeConfig.devicePixelRatio(15),
                  prefixIcon: Icons.person,
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
                SizedBox(
                  height: SizeConfig.height(2.5),
                ),
                CustomElevatedButton(
                    buttonText: "Sign up",
                    textSize: SizeConfig.devicePixelRatio(15),
                    maxHeight: SizeConfig.height(5),
                    maxWidth: SizeConfig.width(90),
                    buttonColor: whiteColor,
                    buttonTextColor: blackColor,
                    onPressed: () {
                      signUp();
                    }),
                SizedBox(
                  height: SizeConfig.height(2.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: whiteColor70,
                        fontSize: SizeConfig.devicePixelRatio(15),
                      ),
                    ),
                    CustomTextButton(
                      buttonText: "Signin",
                      textSize: SizeConfig.devicePixelRatio(15),
                      buttonColor: transparent,
                      buttonTextColor: whiteColor,
                      fontWeight: FontWeight.bold,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
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
