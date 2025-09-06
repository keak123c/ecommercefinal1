import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_page.dart';	
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_dot.dart';
import 'package:get/get.dart';
import 'package:e_commerce/features/authentication/controller/controllers.onboarding/onboarding_controller.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_next.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image1: EImage.onboardingImage1,
                title: 'Welcome to Saint Valentine!',
                subTitle: 'Discover the latest trends, styles, and fashion tips curated just for you. Lets get started on your fashion journey!',
              ),
              OnBoardingPage(
                image1: EImage.onboardingImage2,
                title: 'Ready to Explore?',
                subTitle: 'Discover your new style here - Connect with fashion enthusiasts, share your style, and get inspired by others.',
              ),
            ],
          ),
          //Skip button
          const OnBoardingSkip(),
          //Dot Navigation SmoothPageView
          const OnBoardingDotNavigation(),
          //Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

