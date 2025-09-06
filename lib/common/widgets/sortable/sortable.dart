import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/product_card/product_card_vertical.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';



class ESortableProducts extends StatelessWidget {
  const ESortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: ESizes.defaultSpace, vertical: ESizes.spaceBtwItems),
            child: DropdownButtonFormField(
              value: "Popularity",
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.sort), 
                border: InputBorder.none,
                enabledBorder: InputBorder.none, // Disable enabled state border
                focusedBorder: InputBorder.none,
              ),
              items: ["Popularity", "Lowest price", "Highest price", "Sale", "Newest"].map((option) => DropdownMenuItem(child: Text(option), value: option)).toList(), 
              onChanged: (value){},
            ),
          ),
          //const SizedBox(height: ESizes.spaceBtwItems),
          Padding(
            padding: const EdgeInsets.only(left: ESizes.md, right: ESizes.md, bottom: ESizes.defaultSpace),
            child: EGridLayout(itemCount: 10, itemBuilder: (_, index) => const VerticalProductCard(
              productImageURL: EImage.sambaSneakers,
              productName: 'samba', productPrice: '169', productBrand: 'Adidas',
            )),
          ),
        ],
      );
  }
}