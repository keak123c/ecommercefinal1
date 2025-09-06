import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/screens/card/card_widgets.dart/card_lists.dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ECardScreen extends StatelessWidget {
  const ECardScreen({
    super.key, 
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        title: Text("Card", style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: ECardLists(showAddRemoveButton: true)
        ),
        bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: OutlinedButton(
          onPressed: () => Get.to (() => const CheckoutScreen()), 
          style: OutlinedButton.styleFrom(
            backgroundColor: EHelperFunctions.isDarkMode(context) ? EColors.white : EColors.dark,
            foregroundColor: EHelperFunctions.isDarkMode(context) ? EColors.dark : EColors.white,
            side: BorderSide(
              color: EHelperFunctions.isDarkMode(context) ? EColors.white : EColors.dark,
            )
          ),
          child: const Text("Checkout \$200.0")
        ),
      ),
    );
  }
}

