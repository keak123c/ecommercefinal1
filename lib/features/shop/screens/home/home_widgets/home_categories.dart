import 'package:e_commerce/features/shop/screens/sub-categories/sub_categories.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:get/get.dart';

final List<Map<String, dynamic>> categories = [
  {'icon': EImage.shirtIcon, 'title': 'shirt'},
  {'icon': EImage.jacketIcon, 'title': 'jacket'},
  {'icon': EImage.tShirtIcon, 'title': 'Suit'},
  {'icon': EImage.sneakersIcon, 'title': 'sneaker'},
  {'icon': EImage.jeansIcon, 'title': 'jean'},
];

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: ESizes.defaultSpace),
      child: Column(
        children: [
          //---Categories Heading----
          const ESectionHeading(
            title: 'Categories',
            textColor: Colors.white,
          ),
          const SizedBox(height: ESizes.spaceBtwItems),
          //---Categories Icon---
          SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categories[index];
                return  EVerticalImageText(
                  image: category['icon'],
                  title: category['title'],
                  onTap: () => Get.to(() => const SubCategoriesScreen()),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}