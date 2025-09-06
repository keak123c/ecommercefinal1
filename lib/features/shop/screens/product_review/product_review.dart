import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/screens/product_review/product_review_widgets/overall_product_rating.dart';
import 'package:e_commerce/features/shop/screens/product_review/product_review_widgets/rating_bar.dart';
import 'package:e_commerce/features/shop/screens/product_review/product_review_widgets/user_review_card.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EProductReviewScreen extends StatelessWidget {
  const EProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(title: const Text("Review & Rating"), showBackArrow: true, titleTextStyle: Theme.of(context).textTheme.headlineSmall),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Rating and Review are varified and are from people who use the same type of device that you use."),
              const SizedBox(height: ESizes.spaceBtwItems),
              const EOverallProductRating(),
              const ERatingBarIndicator(rating: 4.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: ESizes.spaceBtwSections),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              
            ]
          ),
        ),
      ),
    );
  }
}





