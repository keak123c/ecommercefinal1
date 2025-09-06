import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_text_verify.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text_.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';


class EProductMetaData extends StatelessWidget {
  const EProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //Discount
            ERoundedContainer(
              radius: ESizes.sm,
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal:ESizes.sm, vertical: ESizes.xs),
              child: Text("30% off", style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
            ),
            const SizedBox(width: ESizes.spaceBtwItems),
            //Price
            Text("\$150", style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: ESizes.spaceBtwItems),
            const EProductPriceText(price: "112.5", isLarge: true),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 1.5),
        //title
        const EProductTitleText(title: "Retro Nike Jacket"),
        const SizedBox(height: ESizes.spaceBtwItems / 1.5),

        Row(
          children: [
            const EProductTitleText(title: "Status:"),
            const SizedBox(width: ESizes.spaceBtwItems / 1.5),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        Row(
          children: [
            CircularImage(image: EImage.jacketIcon, width: 38, height: 38, padding: ESizes.sm,overlayColor: dark ? EColors.white : EColors.black),
            const EBrandTitleWithVerifyIcon(title: "Nike", brandTextSize: TextSize.large),            
          ],
        )
      ],
    );
  }
}