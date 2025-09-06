import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/screens/order/order.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:get/get.dart';


class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});
  @override

  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const EAppBar(
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              //image
              const SizedBox(
                width: 250,
                height: 250,
                child: Image(image: AssetImage(EImage.paymentSuccess)),),
              //Title & Subtitle
              Text("Payment Succesful", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: ESizes.spaceBtwItems),
              Text("Your Items will ship to your address.", style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: ESizes.spaceBtwSections),
              //Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => const OrderScreen()),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: dark ? EColors.white : EColors.black,
                    side: BorderSide(color: dark ? EColors.white : EColors.black),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: dark ? EColors.black : EColors.white),
                  ),
                )
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}