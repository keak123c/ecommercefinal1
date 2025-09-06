import 'package:e_commerce/common/widgets/texts/product_price_text_.dart';
import 'package:e_commerce/features/shop/screens/card/card_widgets.dart/cart_items.dart';
import 'package:e_commerce/features/shop/screens/card/card_widgets.dart/product_quantity_minus_add.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ECardLists extends StatelessWidget {
  const ECardLists({super.key, required this.showAddRemoveButton, this.index = 4});
  final bool showAddRemoveButton;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
            separatorBuilder: (_,__) => const SizedBox(height: ESizes.spaceBtwSections), 
            itemCount: index,
            shrinkWrap: true,
            itemBuilder: (_,index) => Column(
              children: [
                const ECartItem(),
                if(showAddRemoveButton) const SizedBox(height: ESizes.spaceBtwItems),
                if(showAddRemoveButton)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Extra Space
                      Row(
                      children: [
                        SizedBox(width: 70),
                        EProductQuantityWithMinusAddButton(),
                      ],
                      ),
                      EProductPriceText(price: "150", isLarge: false),
                    ],
                  )
              ]
            ),
          );
  }
}