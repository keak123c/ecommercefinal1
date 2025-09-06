
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/features/shop/controllers/home_banner_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/images/e_banner.dart';
import 'package:get/get.dart';

class HomeBannerSlider extends StatelessWidget {
  const HomeBannerSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeBannerController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) => HomeBanner(imageURL: url, fit: BoxFit.cover, backgroundColor: Colors.transparent)).toList(),
          options: CarouselOptions(
            //viewportFraction: 1,
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            onPageChanged: (index, _ ) => controller.updatePageIndicator(index),
          )
        ),
        const SizedBox(height: ESizes.spaceBtwItems),
        Center(
          child: Obx( () =>
             Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++) ECircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carousalCurrentIndex.value == i ? EColors.black : EColors.darkGrey,
                )
                
              ]
            ),
          ),
        )
      ],
    );
  }
}