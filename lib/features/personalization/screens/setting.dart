import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/list_tile/setting_list_tile.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/about_us.dart';
import 'package:e_commerce/features/personalization/screens/profile.dart';
import 'package:e_commerce/features/shop/screens/address/address.dart';
import 'package:e_commerce/features/shop/screens/card/card.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:e_commerce/utils/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        bool isDarkModeEnabled = themeController.themeMode.value == ThemeMode.dark;

        return SingleChildScrollView(
          child: Column(
            children: [
              // --- Header ---
              EPrimaryHeaderContainer(
                child: Column(
                  children: [
                    EAppBar(
                      title: Text(
                        "Settings",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium! 
                            .apply(color: EColors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(
                            left: ESizes.defaultSpace,
                            right: ESizes.defaultSpace),
                        leading: const ERoundedImage(
                          imageURL: EImage.userProfile,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          borderRadius: 50,
                        ),
                        title: Text(
                          "Mean Kimly",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: EColors.white),
                        ),
                        subtitle: Text(
                          "Chhungken@gmail.com",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: EColors.white),
                        ),
                        trailing: IconButton(
                          onPressed: () => Get.to(() => const UserProfileScreen()),
                          icon: const Icon(Iconsax.edit, color: EColors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: ESizes.spaceBtwSections),
                  ],
                ),
              ),
              // --- Body ---
              Padding(
                padding: const EdgeInsets.all(ESizes.defaultSpace),
                child: Column(
                  children: [
                    const ESectionHeading(title: "Account Settings"),
                    const SizedBox(height: ESizes.spaceBtwItems),
                    SettingListTile(
                      icon: Iconsax.safe_home,
                      title: "My Address",
                      subtitle: "Set Delivery Address",
                      onPressed: () => Get.to(() => const EAddressScreen()),
                    ),
                    SettingListTile(
                      icon: Iconsax.shopping_cart,
                      title: "My card",
                      subtitle: "Add new card",
                      onPressed: () => Get.to(() => const ECardScreen()),
                    ),
                    const SettingListTile(
                      icon: Iconsax.bag_tick,
                      title: "My Orders",
                      subtitle: "In-Progress and Completed Orders",
                    ),
                    const SettingListTile(
                      icon: Iconsax.bank,
                      title: "Bank Account",
                      subtitle: "View your setting",
                    ),
                    SettingListTile(
                      icon: Iconsax.safe_home,
                      title: "About Us",
                      subtitle: "Information about our App",
                      onPressed: () => Get.to(() => const AboutUsScreen()),
                    ),
                    //-- App Settings
                    const SizedBox(height: ESizes.spaceBtwSections),
                    const ESectionHeading(title: "App Settings"),
                    const SizedBox(height: ESizes.spaceBtwItems),
                    const SettingListTile(
                      icon: Iconsax.document_upload,
                      title: "Load Your Data",
                      subtitle: "Load Your Data",
                    ),
                    SettingListTile(
                      icon: Iconsax.moon,
                      title: "Dark Mode",
                      subtitle: "Set Your Theme to Dark Mode",
                      trailing: Switch(
                        value: isDarkModeEnabled,
                        onChanged: (value) {
                          themeController.toggleTheme(value);
                        },
                      ),
                    ),
                    SettingListTile(
                      icon: Iconsax.image,
                      title: "HD Quality Image",
                      subtitle: "Set HD Quality Image",
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(height: ESizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: EHelperFunctions.isDarkMode(context)
                              ? EColors.white
                              : EColors.black,
                          side: BorderSide(
                            color: EHelperFunctions.isDarkMode(context)
                                ? EColors.white
                                : EColors.black,
                          ),
                        ),
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            color: EHelperFunctions.isDarkMode(context)
                                ? EColors.black
                                : EColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: ESizes.spaceBtwSections),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
