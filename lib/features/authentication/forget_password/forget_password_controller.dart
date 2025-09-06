import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration.dart/reset_password.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/network/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  //variable reset password email
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormkey = GlobalKey<FormState>();

  //send reset password email
  sendPasswordResetEmail() async {
    try{
      EFullScreenLoader.openLoadingDialog('We are processing your information....', EImage.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        EFullScreenLoader.stopLoading();
        ELoaders.errorSnackBar(title: 'No Internet', message: 'Please check your internet connection');
        return;
      }
      // Form Validation
      if(!forgetPasswordFormkey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //Remove Loader
      EFullScreenLoader.stopLoading();

      // Show Success screen
      ELoaders.successSnackBar(title: "Email Sent", message: "Email Link Sent to Reset your Password". tr);

      //Redirect to reset password screen
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      //Remove Loader
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try{
      EFullScreenLoader.openLoadingDialog('We are processing your information....', EImage.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        EFullScreenLoader.stopLoading();
        ELoaders.errorSnackBar(title: 'No Internet', message: 'Please check your internet connection');
        return;
      }

      // Send Email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove Loader
      EFullScreenLoader.stopLoading();

      // Show Success screen
      ELoaders.successSnackBar(title: "Email Sent", message: "Email Link Sent to Reset your Password". tr);

    } catch (e) {
      //Remove Loader
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}