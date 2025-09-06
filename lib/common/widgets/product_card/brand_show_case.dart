
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/product_card/brand_card.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class EBrandShowCase extends StatelessWidget {
  const EBrandShowCase({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ERoundedContainer(
      showBorder: true,
      borderColor: EColors.grey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(ESizes.md),
      margin: const EdgeInsets.only(bottom: ESizes.spaceBtwItems),
      child: Column(
        children: [
          const EBrandCard(
            showBorder: false,
            title: "Nike",
            productStocks: "256 products",
          ),
          Row( 
            children: images.map((image) => brandTopProductImage(image, context)).toList(),
          )
        ]
      ),
    );
  }
  Widget brandTopProductImage(String image, context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Expanded(
      child: ERoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(ESizes.md),
        margin: const EdgeInsets.only(right: ESizes.sm / 2),
        backgroundColor: dark ? EColors.dark : EColors.white,
        child: Image(image: AssetImage(image), fit: BoxFit.contain),
      ),
    );
  }
}
