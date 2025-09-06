import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class EOrderItemsList extends StatelessWidget {
  const EOrderItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 8,
      separatorBuilder: (_, __) => const SizedBox(height: ESizes.spaceBtwItems),
      itemBuilder: (_, index) => ERoundedContainer(
        showBorder: true,
        backgroundColor: dark ? EColors.dark : EColors.white,
        padding: const EdgeInsets.all(ESizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Row#!
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(width: ESizes.spaceBtwItems / 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Processing", style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.blue, fontWeightDelta: 1)),
                      Text("01 Sep 2023", style: Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34, color: dark ? EColors.white : EColors.black)),
              ],
            ),
            const SizedBox(height: ESizes.spaceBtwItems),
            Row(
              children: [
                //Raw#2
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(width: ESizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order", style: Theme.of(context).textTheme.labelMedium),
                            Text("[#3452]", style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Row#3
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: ESizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shipping Date", style: Theme.of(context).textTheme.labelMedium),
                            Text("02 DEC 2023", style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}