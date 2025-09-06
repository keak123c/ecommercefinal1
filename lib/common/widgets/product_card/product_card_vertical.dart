import 'package:e_commerce/common/styles/card_shadow.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_text_verify.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text_.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/features/shop/screens/product_detail/product_detail.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VerticalProductCard extends StatelessWidget {
  final String productImageURL;
  final String productName;
  final String productPrice;
  final String productBrand;
  const VerticalProductCard({super.key, required this.productImageURL, required this.productName, required this.productPrice, required this.productBrand});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        //padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EShadowStyle.verticalProductShadow],
          //border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(ESizes.productImageRadius),
          color: dark ? EColors.dark : EColors.white,
        ),
        child: Column(
          children: [
            //Thumbnail, Wishlish button, Discount Tag
            ERoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(ESizes.sm),
              backgroundColor: dark ? EColors.dark : EColors.white,
              showBorder: false,
              child: Stack(
                children: [
                  //---Thumbnail Image---
                  ERoundedImage(imageURL: productImageURL, backgroundColor: dark ? Colors.black : Colors.white,),

                  //---Discount Tag---
                  Positioned(
                    top: 12,
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
            const SizedBox(height: ESizes.sm),
            //---Details---
            SizedBox(
              width: double.infinity,
              child:  Padding(
                padding: const EdgeInsets.only(left: ESizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //left, bottom
                  children: [
                    EProductTitleText(title: productName),
                    const SizedBox(height: ESizes.spaceBtwItems / 2),
                    EBrandTitleWithVerifyIcon(title: productBrand),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                Padding(
                  padding:  const EdgeInsets.only(left: ESizes.sm),
                  child:  EProductPriceText(price: productPrice),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: EColors.dark,
                      borderRadius: BorderRadius.only(
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
    );
  }
}