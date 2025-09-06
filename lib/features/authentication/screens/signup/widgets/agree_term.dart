import 'package:e_commerce/features/authentication/controller/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:get/get.dart';


class AgreeTerm extends StatelessWidget {
  const AgreeTerm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 24,
              height: 24,
              child: Obx(
                () => Checkbox(
                    activeColor: dark ? EColors.white : EColors.black, 
                    checkColor: dark ? EColors.black : EColors.white,
                    value: controller.privacyCheck.value, onChanged: (value) => controller.privacyCheck.value = !controller.privacyCheck.value),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex : 9,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "I agree to ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: "Privacy Policy ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                        color: dark ? EColors.white : EColors.black,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? EColors.white : EColors.black,
                      ),
                ),
                TextSpan(
                  text: "and ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: "Terms of use",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                        color: dark ? EColors.white : EColors.black,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? EColors.white : EColors.black,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}