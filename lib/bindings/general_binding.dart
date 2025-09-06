import 'package:e_commerce/utils/network/network_manager.dart';
import 'package:e_commerce/utils/theme/theme_controller.dart';
import 'package:get/get.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies(){
    Get.put(NetworkManager());
    Get.lazyPut(() => ThemeController());
  }
}