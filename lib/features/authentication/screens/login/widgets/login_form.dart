import 'package:e_commerce/features/authentication/controller/login/login_controller.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration.dart/forget_password.dart';
import 'package:e_commerce/features/authentication/screens/signup/signup_screen.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(loginController());
    return Form(
      key: controller.loginformKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ESizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => EValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail_outline_rounded),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => EValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, 
                    icon: controller.hidePassword.value ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.visibility),
                    ),
                ),
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwInputFields),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember me
                Row(
                  children: [
                    //change color of checkbox
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value, 
                           onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value, 
                           activeColor: dark ? EColors.white : EColors.black, 
                           checkColor: dark ? EColors.black : EColors.white,
                          )
                    ),
                    const Text('Remember me'),
                  ],
                ),
                //forget password
                TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: Text('Forget Password?', style: TextStyle(color: dark ? EColors.white : EColors.black))),
              ],
            ),
            const SizedBox(height: ESizes.spaceBtwInputFields),
            //login button
            SizedBox(
              width: double.infinity, 
              child: OutlinedButton(
                onPressed: () => controller.emailAndPasswordLogIn(), 
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: dark ? EColors.white : EColors.black),
                  backgroundColor: dark ? EColors.white : EColors.black, 
                  ), 
                child: Text('Login', style: TextStyle(color: dark ? EColors.black : EColors.white),))
              ),
            const SizedBox(height: ESizes.spaceBtwItems),
            // create account
            SizedBox(
              width: double.infinity, 
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()), 
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: EColors.grey),
                ),
                child: const Text('Create Account'),
                )
              ),
            const SizedBox(height: ESizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}

