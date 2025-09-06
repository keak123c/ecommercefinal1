import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/product_card/brand_card.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/all_brand/brand_product.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(
        title: Text("All Brands"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ESectionHeading(title: "Brands", showActionButton: false),
            const SizedBox(height: ESizes.spaceBtwItems),
            EGridLayout(itemCount: 10, itemBuilder: (context,index) => EBrandCard(showBorder: true, title: "Addidas", productStocks: "200", onTap: ()=>Get.to(() => const BrandProduct()), )),
          ],
        ),
      ),
    );
  }
}