import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/images/e_banner.dart';
import 'package:e_commerce/common/widgets/product_card/product_card_horizontal.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(
        title: Text("T-Shirt"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              const HomeBanner(imageURL: EImage.clothesBanner2, width: 350, height: 150, fit: BoxFit.cover,applyImageRadius: true),
              const SizedBox(height: ESizes.spaceBtwItems),
              //SubCategories
              Column(
                children: [
                  const ESectionHeading(title: "Sports T-Shirts", showActionButton: true),
                  const SizedBox(height: ESizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: ESizes.spaceBtwItems),
                      itemBuilder: (context, index) => const HorizontalProductcard(),
                    ),
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems),
                  const ESectionHeading(title: "Formal T-Shirts", showActionButton: true),
                  const SizedBox(height: ESizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: ESizes.spaceBtwItems),
                      itemBuilder: (context, index) => const HorizontalProductcard(),
                    ),
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}