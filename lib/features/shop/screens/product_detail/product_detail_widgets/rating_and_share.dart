import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
class RateAndShare extends StatelessWidget {
  const RateAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              Row( 
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Iconsax.star5, color: Colors.amber, size: 24),
                  const SizedBox(width: ESizes.spaceBtwItems / 2),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                        const TextSpan(text: '(120)'),
                      ]
                    )
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.share, color: dark ? EColors.white : EColors.black, size: ESizes.iconMd)),
            ]
          )
        ]
      );
  }
}

