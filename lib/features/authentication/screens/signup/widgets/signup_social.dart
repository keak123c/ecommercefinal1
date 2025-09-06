import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_string.dart';


class OtherSignup extends StatelessWidget {
  const OtherSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: EColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(EImage.facebookLogo),
              width: ESizes.iconMd,
              height: ESizes.iconMd,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: ESizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: EColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(EImage.googleLogo),
              width: ESizes.iconMd,
              height: ESizes.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}