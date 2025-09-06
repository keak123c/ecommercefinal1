import 'package:e_commerce/features/authentication/forget_password/forget_password_controller.dart';
//import 'package:e_commerce/features/authentication/screens/password_configuration.dart/reset_password.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:get/get.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              //header
              Text("Forget Password", style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: ESizes.spaceBtwItems),
              Text("Don't worry, Please enter your email address. You will receive a link to create a new password via email.", style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: ESizes.spaceBtwSections),
              Form(
                key: controller.forgetPasswordFormkey,
                child: TextFormField(
                  controller: controller.email,
                  validator: EValidator.validateEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline_rounded),
                    labelText: 'Email',
                  ),
                )
              ),
              const SizedBox(height: ESizes.spaceBtwSections),
              //button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => controller.sendPasswordResetEmail(),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: dark ? EColors.white : EColors.black,
                    side: BorderSide(color: dark ? EColors.white : EColors.black),
                  ),
                  child: Text("Submit", style: TextStyle(color: dark ? EColors.black : EColors.white)),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}