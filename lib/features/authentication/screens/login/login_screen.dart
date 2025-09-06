import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/common/styles/spacing_style.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_divider.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_social.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //title&subtitle
              const TittleSubtitle(),
              //form
              LoginForm(dark: dark),
              //devider
              Devider(dark: dark),
              const SizedBox(height: ESizes.spaceBtwSections),
              //social login
              const SocialLogin()
            ],
          )
        ),
      ),
    );
  }
}

