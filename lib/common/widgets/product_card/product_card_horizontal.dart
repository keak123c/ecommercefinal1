import 'package:e_commerce/common/styles/card_shadow.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_text_verify.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text_.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HorizontalProductcard extends StatelessWidget {
  const HorizontalProductcard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 310,
        //padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EShadowStyle.horizonatalProductShadow],
          //border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(ESizes.productImageRadius),
          color: dark ? EColors.darkerGrey : EColors.lightContainer,
          //border: Border.all(color: Colors.red),
        ),
        child: Row(
          children: [
            ERoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(ESizes.sm),
              backgroundColor: dark ? EColors.dark : EColors.white,
              child: Stack(
                children: [
                  const SizedBox(
                    width: 120,
                    height: 120,
                    child: ERoundedImage(
                      imageURL: EImage.sambaSneakers, 
                      applyImageRadius: true
                    )
                  ),
                  Positioned(
                    top: 10,
                    child: ERoundedContainer(
                      radius: ESizes.sm,
                      backgroundColor: Colors.yellow.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: ESizes.sm, vertical: ESizes.xs),
                      child:  Text("25%", style: Theme.of(context).textTheme.labelLarge!.apply(color: EColors.black)),
                    ),
                  ),
                  //---Wishlish button---
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: ECircularIcon(icon: Iconsax.heart, color: Colors.red),
                  ),
                ],
              ),
            ),
            //Detail
            SizedBox(
              width: 172,
              height: 120,
              child:  Padding(
                padding: const EdgeInsets.only(left: ESizes.sm, top: ESizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //left, bottom
                  children: [
                    const EProductTitleText(title: 'Adidas Samba OGGG', smallSize: true, maxLines: 2),
                    const SizedBox(height: ESizes.spaceBtwItems / 2),
                    const EBrandTitleWithVerifyIcon(title: "Adidas"),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(child: EProductPriceText(price: '66.0')),
                        Container(
                          decoration: BoxDecoration(
                            color: dark ? EColors.darkerGrey : EColors.dark,
                            borderRadius:  BorderRadius.only(
                              topLeft: Radius.circular(ESizes.cardRadiusMd),
                              bottomRight: Radius.circular(ESizes.productImageRadius),
                            )
                          ),
                          child: const SizedBox(
                            width: ESizes.iconLg * 1.2,
                            height: ESizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: Colors.white, size: ESizes.iconLg)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}