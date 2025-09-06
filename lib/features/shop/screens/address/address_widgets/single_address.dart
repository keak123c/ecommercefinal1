import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ESingleAddress extends StatelessWidget {
  const ESingleAddress({
    super.key, 
    required this.selectedAddress,
  });
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return ERoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? EColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : dark ? EColors.darkerGrey : EColors.grey,
      margin: const EdgeInsets.only(bottom: ESizes.spaceBtwItems),
      padding: const EdgeInsets.all(ESizes.md),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Icons.check_circle : Icons.circle_outlined,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Playboi carti", style: Theme.of(context).textTheme.titleLarge, maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: ESizes.sm/2),
              const Text("(885) 034251242", maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: ESizes.sm / 2),
              const Text("123 Main St, California ,Anytown USA", softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}