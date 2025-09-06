import 'package:e_commerce/features/authentication/controller/signup/verify_email_controller.dart';
import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';


class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen ({super.key, this.email});
  final String ? email;
  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(Icons.clear_rounded))
        ],
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
                child: Image(image: AssetImage(dark ? EImage.darkVerifyEmailImage : EImage.lightVerifyEmailImage))),
              //Title & Subtitle
              Text("Verify your email address!", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: ESizes.spaceBtwItems),
              Text(email ?? ' ', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: ESizes.spaceBtwItems),
              Text("Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Fashion.", style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: ESizes.spaceBtwSections),
              //Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => controller.checkEmailVerificationStatus()),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: dark ? EColors.white : EColors.black,
                    side: BorderSide(color: dark ? EColors.white : EColors.black),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: dark ? EColors.black : EColors.white),
                  ),
                )
              ),
              const SizedBox(height: ESizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => controller.sendEmailVerification()),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: EColors.grey),
                  ),
                  child: Text(
                    "Resend Email",
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