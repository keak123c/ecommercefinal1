import 'package:e_commerce/features/authentication/controller/controllers.onboarding/onboarding_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/constants/colors.dart';



class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: ESizes.defaultSpace,
      bottom: EDeviceUtils.getBottomNavigationHeight() - 9,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const CircleBorder(),
          side: const BorderSide(color: EColors.grey),
          // change the size of the button
          minimumSize: const Size(60, 60),
        ),
        onPressed: () => OnBoardingController.instance.nextPage(),
        child: const Icon(
          Icons.chevron_right,
          color: EColors.grey,
          size: 30.0,
        ),
      )
    );
  }
}