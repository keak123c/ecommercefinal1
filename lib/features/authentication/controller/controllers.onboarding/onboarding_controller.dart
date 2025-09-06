import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  //Update Current Index when Page Scroll
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  //Jump to the specific dot selected page
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  //Update Current Index & jump to next page
  void nextPage() {
  if (currentPageIndex.value == 1) {
      final storage = GetStorage();
      storage.write('IsFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }


  //Update Current Index & jump to last page
  void skipPage() {
    currentPageIndex.value = 1;
    pageController.jumpToPage(1);
  }
}