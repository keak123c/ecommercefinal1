import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/product_card/brand_show_case.dart';
import 'package:e_commerce/common/widgets/product_card/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class ECategoryTab extends StatelessWidget {
  const ECategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
      SingleChildScrollView(
        child: Column(
          children: [
            //---Brands---
            const Padding(
              padding: EdgeInsets.only(left: ESizes.defaultSpace, right: ESizes.defaultSpace, top: ESizes.defaultSpace),
              child: EBrandShowCase(
                images: [EImage.nikeJacket1, EImage.nikeJacket2, EImage.nikeJacket3],
              ),
            ),
            ESectionHeading(title: "More Products", showActionButton: true, onPressed: (){}, padding: const EdgeInsets.symmetric(horizontal: ESizes.md)),
            const SizedBox(height: ESizes.spaceBtwItems),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: ESizes.sm),
              child: EGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const VerticalProductCard(
                  productImageURL: EImage.sambaSneakers,
                  productName: 'samba', productPrice: '169', productBrand: 'Adidas',
                ),
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwItems),
          ],
        ),   
      );    
  }
}



