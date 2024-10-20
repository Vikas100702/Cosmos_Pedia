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

  void signUp() async {
    String res = await AuthServices().signUp(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    // if signup is successful, user has been created and navigate to next screen else show error message.
    if (res == "Success") {
      setState(() {
        isLoading = true;
      });

      // Navigate to next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });

      // Show error message
      customSnackBar(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeConfig.devicePixelRatio(5),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        text: res,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"), // Background image from assets
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.height(10), // Add space before the logo
                ),
                ClipOval( child: SizedBox(
                  width: SizeConfig.width(30),
                  height: SizeConfig.height(20),
                  child: Image.asset("assets/Blue.png"), // Logo
                ),),

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
                  iconColor: whiteColor,
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
                  iconColor: whiteColor,
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
                  iconColor: whiteColor,
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
                  onPressed: signUp,
                ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
