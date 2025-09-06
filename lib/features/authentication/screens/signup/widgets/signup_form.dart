import 'package:e_commerce/features/authentication/controller/signup/signup_controller.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/agree_term.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    final dark = EHelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupformKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => EValidator.validateEmptyText("First Name", value),
                  decoration: const InputDecoration(
                    labelText: "First Name",
                    prefixIcon: Icon(Icons.person_outline_rounded),
                  ),
                ),
              ),
              const SizedBox(width: ESizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => EValidator.validateEmptyText("Last Name", value),
                  decoration: const InputDecoration(
                    labelText: "Last Name",
                    prefixIcon: Icon(Icons.person_outline_rounded),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: ESizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.username,
            validator: (value) => EValidator.validateEmptyText("Username", value),
            decoration: const InputDecoration(
              labelText: "Username",
              prefixIcon: Icon(Icons.person_outline_rounded),
            ),
          ),
          const SizedBox(height: ESizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => EValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: "Email",
              prefixIcon: Icon(Icons.mail_outline_rounded),
            ),
          ),
          const SizedBox(height: ESizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => EValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: "Phone Number",
              prefixIcon: Icon(Icons.phone_android_rounded),
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
          AgreeTerm(dark: dark),
          const SizedBox(height: ESizes.spaceBtwInputFields),
          // Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => controller.signup(),
              style: OutlinedButton.styleFrom(
                backgroundColor: dark ? EColors.white : EColors.black,
                side: BorderSide(color: dark ? EColors.white : EColors.black),
              ),
              child: Text(
                "Create Account",
                style: TextStyle(color: dark ? EColors.black : EColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

