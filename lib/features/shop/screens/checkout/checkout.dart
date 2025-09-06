import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/features/shop/screens/card/card_widgets.dart/card_lists.dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout_widgets.dart/billing_payment_address.dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout_widgets.dart/billing_payment_method.dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout_widgets.dart/billing_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout_widgets.dart/coupon_enter.dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout_widgets.dart/succes_payment.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =  EHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const EAppBar(title: Text("Order Review"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              const ECardLists(showAddRemoveButton: false, index: 2),
              const SizedBox(height: ESizes.spaceBtwSections),
              const ECouponEnter(),
              const SizedBox(height: ESizes.spaceBtwSections),
              ERoundedContainer(
                showBorder: true,
                backgroundColor: dark ? EColors.dark : EColors.white,
                padding: const EdgeInsets.all(ESizes.md),
                child: const Column(
                  children: [
                    //Price
                    EBillingPaymentSection(),
                    SizedBox(height: ESizes.spaceBtwItems),
                    //Divider
                    Divider(),
                    SizedBox(height: ESizes.spaceBtwItems),
                    //Payment Methods
                    EBillingPaymentMethod(),
                    SizedBox(height: ESizes.spaceBtwItems),
                    //Address
                    EBillingPaymentAddress(),
                    SizedBox(height: ESizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: OutlinedButton(
          onPressed: () => Get.to (() => const PaymentSuccessScreen()), 
          style: OutlinedButton.styleFrom(
            backgroundColor: EHelperFunctions.isDarkMode(context) ? EColors.white : EColors.dark,
            foregroundColor: EHelperFunctions.isDarkMode(context) ? EColors.dark : EColors.white,
            side: BorderSide(
              color: EHelperFunctions.isDarkMode(context) ? EColors.white : EColors.dark,
            )
          ),
          child: const Text("Checkout")
        ),
      )
    );
  }
}
