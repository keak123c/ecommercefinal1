import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';


class SuccessScreen
 extends StatelessWidget {const SuccessScreen({super.key, this.onPressed});
 final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.clear_rounded))
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
                child: Image(image: AssetImage(dark ? EImage.darkSuccessVerifyEmailImage : EImage.lightSuccessVerifyEmailImage))),
              //Title & Subtitle
              Text("Your Account successfully created", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: ESizes.spaceBtwItems),
              Text("Welcome to Your Ultimate Fashion Destination: Your Account is Created. Unleash the joy of Seamless Online Shopping.", style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: ESizes.spaceBtwSections),
              //Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onPressed,
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
              
            ],
          ),
        ),
      ),
    );
  }
}