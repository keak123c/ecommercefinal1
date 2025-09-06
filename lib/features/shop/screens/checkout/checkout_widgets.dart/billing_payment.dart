import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class EBillingPaymentSection extends StatelessWidget {
  const EBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ESectionHeading(title: "Payment Method", buttonTitle: "Change", onPressed: (){}),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        Row(
          children: [
            ERoundedContainer(
              width: 70,
              height: 35,
              backgroundColor: EHelperFunctions.isDarkMode(context) ? EColors.dark : EColors.white,
              padding: const EdgeInsets.all(ESizes.sm),
              child: const Image(image: AssetImage(EImage.khQRLogo), fit: BoxFit.contain),
            ),
            const SizedBox(width: ESizes.spaceBtwItems / 2),
            Text("KHQR", style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}