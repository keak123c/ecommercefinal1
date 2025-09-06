import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_text_verify.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ECartItem extends StatelessWidget {
  const ECartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row (
      children: [
        ERoundedImage(
          imageURL: EImage.nikeJacket3, 
          width: 60, 
          height: 60, 
          fit: BoxFit.cover,
          padding: const EdgeInsets.all(ESizes.sm),
          backgroundColor: EHelperFunctions.isDarkMode(context) ? EColors.darkerGrey : EColors.grey,
        ),
        const SizedBox(width: ESizes.spaceBtwItems),
        //Title, Price, & Size
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EBrandTitleWithVerifyIcon(title: "Nike"),
            const EProductTitleText(title: "Nike White Jacket", maxLines: 1),
            //Attribute
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Color: ", style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: "Green ", style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: "Size: ", style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: "UK 10 ", style: Theme.of(context).textTheme.bodyLarge),
                ]
              )
            )
          ],
        )
      ],
    );
  }
}