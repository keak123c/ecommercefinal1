
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/product_card/product_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        title: Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const HomeScreen()), 
            icon: Icon(Iconsax.add, color: EHelperFunctions.isDarkMode(context) ? EColors.white : EColors.black),
            iconSize: ESizes.iconLg,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:  ESizes.defaultSpace, horizontal: ESizes.sm),
          child: Column(
            children: [
              EGridLayout(itemCount: 6, itemBuilder: (_, index) => const VerticalProductCard(
                productImageURL: EImage.sambaSneakers,
                productName: 'samba', productPrice: '169', productBrand: 'Adidas',
              )),
            ],
          ),
        ),
      ),
    );
  }
}