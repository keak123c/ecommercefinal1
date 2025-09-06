import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/product_detail/product_detail_widgets/bottom_add_to_card.dart';
import 'package:e_commerce/features/shop/screens/product_detail/product_detail_widgets/product_attribute.dart';
import 'package:e_commerce/features/shop/screens/product_detail/product_detail_widgets/product_detail_image_slider.dart';
import 'package:e_commerce/features/shop/screens/product_detail/product_detail_widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_detail/product_detail_widgets/rating_and_share.dart';
import 'package:e_commerce/features/shop/screens/product_review/product_review.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const EBottomAddToCard(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product image slider
            const ProductDetailImageSlider(),
            Padding(
              padding: const EdgeInsets.only(bottom: ESizes.defaultSpace, left: ESizes.defaultSpace, right: ESizes.defaultSpace),
              child: Column(
                children: [
                  //rating and share
                  const RateAndShare(),
                  const SizedBox(height: ESizes.spaceBtwItems / 2),
                  //price, title, stock & brand
                  const EProductMetaData(),
                  const SizedBox(height: ESizes.spaceBtwItems / 2),
                  //attribute
                  const EProductAttribute(),
                  const SizedBox(height: ESizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: EHelperFunctions.isDarkMode(context) ? Colors.white : Colors.black, // Set background color
                        side: BorderSide(color: EHelperFunctions.isDarkMode(context) ? Colors.white : Colors.black), // Set border color and width
                        foregroundColor: EHelperFunctions.isDarkMode(context) ? Colors.black : Colors.white, // Set text color
                      ),
                      child: const Text("Checked"),
                    ),
                  ),
                  const SizedBox(height: ESizes.spaceBtwSections),

                  //description
                  const ESectionHeading(title: "Description", showActionButton: false, padding: EdgeInsets.zero),
                  const SizedBox(height: ESizes.spaceBtwItems / 2),
                  const ReadMoreText(
                    "This is a product description for white nike jacket. There more details about this product and now I just want this text line longer",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: "Less",
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  //Review
                  const Divider(),
                  const SizedBox(height: ESizes.spaceBtwItems), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ESectionHeading(title: "Reviews(199)", showActionButton: false),
                      IconButton(onPressed: () => Get.to(() => const EProductReviewScreen()), icon: Icon(Iconsax.arrow_right_3, size: 18, color: EHelperFunctions.isDarkMode(context) ? EColors.white : EColors.black)),
                    ],
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems),            
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}



