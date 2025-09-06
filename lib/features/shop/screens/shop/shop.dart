import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/appbar/tabbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/product_card/brand_card.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/all_brand/brand_product.dart';
import 'package:e_commerce/features/shop/screens/shop/shop_widgets/e_category_tab.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/product_card/card_menu_icon.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';




class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        //backgroundColor: dark ? EColors.black : EColors.white,
        appBar: EAppBar(
          title: Text("Shop", style: Theme.of(context).textTheme.headlineMedium),
          actions: [
             CartMenuIcon(
              onPressed: (){},
             )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScroll){
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? EColors.dark : EColors.white,
                expandedHeight: 420,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(ESizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //---SearchBar---
                      const SizedBox(height: ESizes.spaceBtwItems),
                      const ESearchBar(text: "Search in Shop", padding: EdgeInsets.zero),
                      const SizedBox(height: ESizes.spaceBtwSections),
                      //---Feather Brand---
                      ESectionHeading(title: 'Featured Brand', showActionButton: false, onPressed: (){}),
                      const SizedBox(height: ESizes.spaceBtwItems),
      
                      EGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index){
                        return EBrandCard(
                          showBorder: true,
                          title: "Nike",
                          productStocks: "256 products",
                          onTap: () => Get.to(() => const BrandProduct()),
                        );
                        }
                      )
                    ],
                  )
                ),
              //Tabs
                bottom: const ETabBar(
                  tabs: [
                    Tab(text: "T-Shirts"),
                    Tab(text: "Shoes"),
                    Tab(text: "Hoodies"),
                    Tab(text: "Jackets"),
                    Tab(text: "Pants"),
                    Tab(text: "Hats"),
                    Tab(text: "Socks"),
                  ],
                )
              )
            ];
          }, 
          body: const TabBarView(
            children: [
              ECategoryTab(),
              ECategoryTab(),
              ECategoryTab(),
              ECategoryTab(),
              ECategoryTab(),
              ECategoryTab(),
              ECategoryTab(),
            ]
          )
        ),
      ),
    );
  }
}





