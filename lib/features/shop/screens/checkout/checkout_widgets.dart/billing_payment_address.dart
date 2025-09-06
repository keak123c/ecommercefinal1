import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EBillingPaymentAddress extends StatelessWidget {
  const EBillingPaymentAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ESectionHeading(title: "Shipping Addres", showActionButton: true, buttonTitle: "Change"),
        const SizedBox(height: ESizes.spaceBtwItems),
        Text("Lil Uzi Vert", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: ESizes.spaceBtwItems),
            Text("+885-343-4343", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.location_city, color: Colors.grey, size: 16),
            const SizedBox(width: ESizes.spaceBtwItems),
            Text("South Liana, California 8435, USA", style: Theme.of(context).textTheme.bodyMedium),
          ],
        )
      ],
    );
  }
}