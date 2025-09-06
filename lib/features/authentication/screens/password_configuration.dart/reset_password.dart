import 'package:e_commerce/features/authentication/forget_password/forget_password_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen ({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.clear_rounded))
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              //image
              SizedBox(
                width: 250,
                height: 250,
                child: Image(image: AssetImage(dark ? EImage.darkChangePasswordImage: EImage.lightChangePasswordImage)),),
              //Title & Subtitle
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
              const SizedBox(height: ESizes.spaceBtwItems),
              Text("Your Password has been successfully changed", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: ESizes.spaceBtwItems),
              Text("Your Accout security is our top priority! We're Sent You a secure Link to Safety Chnage Your Password and Keep Your Account Secure.", style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: ESizes.spaceBtwSections),
              //Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: dark ? EColors.white : EColors.black,
                    side: BorderSide(color: dark ? EColors.white : EColors.black),
                  ),
                  child: Text(
                    "Done",
                    style: TextStyle(color: dark ? EColors.black : EColors.white),
                  ),
                )
              ),
              const SizedBox(height: ESizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: dark ? EColors.black : EColors.white,
                    side: BorderSide(color: dark ? EColors.white : EColors.black),
                  ),
                  child: Text(
                    "Resend",
                    style: TextStyle(color: dark ? EColors.white : EColors.black),
                  ),
                )
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}