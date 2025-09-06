import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EBottomAddToCard extends StatelessWidget {
  const EBottomAddToCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ESizes.defaultSpace, vertical: ESizes.defaultSpace / 2),
      decoration: const BoxDecoration(
        color: EColors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ESizes.cardRadiusLg),
          topRight: Radius.circular(ESizes.cardRadiusLg),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ECircularIcon(
                icon: Iconsax.minus,
                backgroundColor: EColors.darkGrey,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              const SizedBox(width: ESizes.spaceBtwItems),
              Text("2", style: Theme.of(context).textTheme.titleSmall!.apply(color: dark ? EColors.white : EColors.black)),
              const SizedBox(width: ESizes.spaceBtwItems),
              const ECircularIcon(
                icon: Iconsax.add,
                backgroundColor: EColors.black,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ],
          ),
          OutlinedButton(
            onPressed: (){},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(ESizes.md),
              backgroundColor: dark ? EColors.white : EColors.black,
              side: BorderSide(color: dark ? EColors.white : EColors.black),
            ), 
            child: Text("Add to Cart", style: TextStyle(color: dark ? EColors.black : EColors.white)),
          )
        ],
      ),
    );
  }
}