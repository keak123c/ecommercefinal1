import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_header.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_social.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_divider.dart';





class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ESizes.defaultSpace, vertical: ESizes.md),
          child: Column(
            children: [
              // Header
              const SignupHeader(),
              const SizedBox(height: ESizes.spaceBtwSections),

              // Form
              const SignupForm(),
              const SizedBox(height: ESizes.spaceBtwInputFields),

              // Divider
              CustomDivider(dark: dark),
              const SizedBox(height: ESizes.spaceBtwItems),

              // Other Sign-in Options
              const OtherSignup(),
            ],
          ),
        ),
      ),
    );
  }
}



