import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/features/shop/screens/product_review/product_review_widgets/rating_bar.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(EImage.userProfile)),
                const SizedBox(width: ESizes.spaceBtwItems),
                Text("Playboi carti", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems),
        Row(
          children: [
            const ERatingBarIndicator(rating: 3.5),
            const SizedBox(width: ESizes.spaceBtwItems),
            Text("01/DEC/2022", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems),
        const ReadMoreText(
          "The user interface for comment and review on the product that user have been bought and test it. The user interface for comment and review on the product that user have been bought and test it",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        ERoundedContainer(
          backgroundColor: EHelperFunctions.isDarkMode(context) ? EColors.darkerGrey : EColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(ESizes.md), 
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Valentine Store", style: Theme.of(context).textTheme.titleMedium),
                    Text("01/DEC/2022", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: ESizes.spaceBtwItems),
                const ReadMoreText(
                  "The user interface for comment and review on the product that user have been bought and test it. The user interface for comment and review on the product that user have been bought and test it",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ),
        ),
        const SizedBox(height: ESizes.spaceBtwItems),
      ]
    );
  }
}