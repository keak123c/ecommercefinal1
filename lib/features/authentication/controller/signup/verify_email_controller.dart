
import 'dart:async';

import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/screens/signup/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get intance => Get.find();
  @override 
  void onInit(){
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }
  //Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ELoaders.successSnackBar(title: "Email Sent", message: "Please Check your inbox and verify your email");
    } catch (e) {
      ELoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect(){
    Timer.periodic(
      const Duration(seconds: 1), 
      (timer) async { 
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if(user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      }
    );
  }

  //Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
        () => SuccessScreen(
          onPressed: () => SuccessScreen(
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        )
      );
    }
  }
}