import 'package:e_commerce/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text_.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class EProductAttribute extends StatelessWidget {
  const EProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ERoundedContainer(
          padding: const EdgeInsets.all(ESizes.md),
          backgroundColor: dark ? EColors.darkGrey : EColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const ESectionHeading(title: "Variation", showActionButton: false),
                  const SizedBox(width: ESizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const EProductTitleText(title: "Price : ", smallSize: true),
                          const SizedBox(width: ESizes.spaceBtwItems / 2),
                          Text("\$25", style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: ESizes.spaceBtwItems / 2),
                          const EProductPriceText(price: "20")
                        ],
                      ),
                      
                      Row(
                        children: [
                          const EProductTitleText(title: "Status : ", smallSize: true),
                          Text("In Stock", style: Theme.of(context).textTheme.titleMedium,)
                        ],
                      ),
                    ],
                  ),
                ]
              ),
              const EProductTitleText(
                title: "This is the description of the Product and it can go up to max 4 lines",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          )
        ),
        const SizedBox(height: ESizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(title: "Colors"),
            const SizedBox(height: ESizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                EChoiceChip(text: "red"	, selected: false, onSelected: (value){}),
                EChoiceChip(text: "blue"	, selected: true, onSelected: (value){}),
                EChoiceChip(text: "yellow"	, selected: false, onSelected: (value){}),
              ],
            )
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(title: "Sizes"),
            const SizedBox(height: ESizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                EChoiceChip(text: "EU 34"	, selected: true, onSelected: (value){}),
                EChoiceChip(text: "EU 36"	, selected: false, onSelected: (value){}),
                EChoiceChip(text: "EU 38"	, selected: false, onSelected: (value){}),
              ]
            )
          ],
        ),
      ]
    );
  }
}