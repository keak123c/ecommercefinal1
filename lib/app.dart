import 'package:e_commerce/bindings/general_binding.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/onboading.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:e_commerce/utils/theme/theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Correctly instantiate and register the ThemeController
    final themeController = Get.put(ThemeController());

    return Obx(() => GetMaterialApp(
          // ignore: deprecated_member_use
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          themeMode: themeController.themeMode.value,
          theme: EAppTheme.lightTheme,
          darkTheme: EAppTheme.darkTheme,
          initialBinding: GeneralBinding(),
          home: const OnBoardingScreen(),
        ));
  }
}
