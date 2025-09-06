import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EBillingPaymentSection extends StatelessWidget {
  const EBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
                Text("\$200", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: ESizes.spaceBtwItems / 2),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping fee", style: Theme.of(context).textTheme.bodyMedium),
                Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            const SizedBox(height: ESizes.spaceBtwItems / 2),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tax fee", style: Theme.of(context).textTheme.bodyMedium),
                Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            const SizedBox(height: ESizes.spaceBtwItems / 2),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order Total", style: Theme.of(context).textTheme.bodyMedium),
                Text("\$212.0", style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: ESizes.spaceBtwItems / 2),
          ],
        )
      ],
    );
  }
}