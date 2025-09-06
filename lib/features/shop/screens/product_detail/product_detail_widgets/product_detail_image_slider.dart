import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/curved_edges/custom_curved_edges.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class ProductDetailImageSlider extends StatelessWidget {
  const ProductDetailImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return ECurvedEdgesWidget(
      child: Container(
        color: dark ? EColors.darkerGrey : EColors.grey,
        child: Stack(
          children: [
            //Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(ESizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(EImage.nikeJacket2))),
              )
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: ESizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: ESizes.spaceBtwItems),
                  itemBuilder: (_,__) => ERoundedImage(
                    imageURL: EImage.nikeJacket2,
                    width: 80,
                    backgroundColor: dark ? EColors.grey : EColors.darkGrey,
                    border: Border.all(color: dark ? EColors.white : EColors.black),
                    padding: const EdgeInsets.all(ESizes.sm),
                  ),
                ),
              ),
            ),
            const EAppBar(
              showBackArrow: true,
              actions: [
                ECircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ]
            ),
          ],
        ),
      )
    );
  }
}

