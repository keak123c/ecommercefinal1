import 'package:e_commerce/features/personalization/screens/setting.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/shop/shop.dart';
import 'package:e_commerce/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationMenuController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: dark ? const Color.fromARGB(255, 0, 0, 0) : Colors.white,
          height: 80,
          elevation: 0,
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: (value) => controller.currentIndex.value = value,
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: 'Store',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: 'Wishlish',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.currentIndex.value]),
    );
  }
}


class NavigationMenuController extends GetxController {
  final Rx<int> currentIndex = 0.obs;

  final screen = [
    const HomeScreen(),
    const ShopScreen(), 
    const WishlistScreen(), 
    const SettingScreen(),
  ];
}