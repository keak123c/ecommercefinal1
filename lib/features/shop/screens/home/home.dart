import 'package:e_commerce/common/widgets/product_card/product_card_vertical.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/all_product/all_product.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/features/shop/screens/home/home_widgets/home_appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce/features/shop/screens/home/home_widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/home_widgets/home_banner_slider.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:get/get.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> product = [
      ProductModel(
        imageUrl: EImage.sambaSneakers,
        name: "Samba Sneakers",
        price: "99.00",
        brand: "Adidas",
      ),
      ProductModel(
        imageUrl: EImage.nikeJacket1,
        name: "Jacket summer",
        price: "150.00",
        brand: "Nike",
      ),
      ProductModel(
        imageUrl: EImage.nikeJacket2,
        name: "Jacket winter",
        price: "130.00",
        brand: "Nike",
      ),
      ProductModel(
        imageUrl: EImage.nikejacket4,
        name: "Jacket edition",
        price: "180.00",
        brand: "Adidas",
      ),
    ];


    return Scaffold(
      //appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-----Header-----
            const EPrimaryHeaderContainer(
                height: 385,
                child: Column(
                  children: [
                    //-----Appbar-----
                    HomeAppBar(),
                    SizedBox(height: ESizes.spaceBtwSections),
                    //-----SearchBar-----
                    ESearchBar(
                      text: 'Search',
                    ),
                    SizedBox(height: ESizes.spaceBtwItems),
                    //-----Categories-----
                    HomeCategories(),
                  ],
                )
            ),
            //-----Body-----
            Padding(
              padding: const EdgeInsets.all(ESizes.sm),
              //----Promo Slider----
              child: Column(
                children: [
                  const HomeBannerSlider(banners: [EImage.clothesBanner, EImage.clothesBanner2, EImage.sneakerBanner],),
                  const SizedBox(height: ESizes.spaceBtwSections),

                  //Heading
                  ESectionHeading(
                    title: "Popular Product",
                    showActionButton: true,
                    padding: const EdgeInsets.symmetric(horizontal: ESizes.sm),
                    onPressed: () => Get.to(() => const AllProductScreen(title: "Popular Product")),
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems),
                  //----Popular Product---
                  EGridLayout(
                    itemCount: product.length,
                    itemBuilder: (_, index) => VerticalProductCard(
                      productImageURL: product[index].imageUrl,
                      productName: product[index].name,
                      productPrice: product[index].price,
                      productBrand: product[index].brand,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
