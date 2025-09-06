import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/screens/address/add_address.dart';
import 'package:e_commerce/features/shop/screens/address/address_widgets/single_address.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EAddressScreen extends StatelessWidget {
  const EAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: dark? EColors.grey : EColors.darkerGrey,
        onPressed: () => Get.to(() => const EAddAddesses()), 
        child: Icon(Icons.add, color: dark? EColors.black : EColors.white),
      ),
      appBar: EAppBar(
        title: Text("Addresses", style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              ESingleAddress(selectedAddress: true),
              ESingleAddress(selectedAddress: false),
            ],
          ),
        )
      ),
    );
  }
}