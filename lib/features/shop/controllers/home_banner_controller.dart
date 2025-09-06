import 'package:get/get.dart';

class HomeBannerController extends GetxController {
  static HomeBannerController get instance => Get.find();

  final carousalCurrentIndex = 0.obs; 

  void updatePageIndicator(index) { carousalCurrentIndex.value = index;}
}