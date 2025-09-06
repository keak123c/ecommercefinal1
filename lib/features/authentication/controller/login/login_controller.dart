import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/network/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
class loginController extends GetxController {
   //variables
   final rememberMe = false.obs;
   final hidePassword = true.obs;
   final localStorage = GetStorage();
   final email = TextEditingController();
   final password = TextEditingController();
   GlobalKey<FormState> loginformKey = GlobalKey<FormState>();

  @override
  void onInit(){
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

   /// --Email and password log in
   Future<void> emailAndPasswordLogIn() async {
   try {
      // Start loading
      EFullScreenLoader.openLoadingDialog('Logging in....', EImage.docerAnimation);
      
      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        EFullScreenLoader.stopLoading();
        ELoaders.errorSnackBar(title: 'No Internet', message: 'Please check your internet connection');
        return;
      }

      //Form Validation
      if(!loginformKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      //Attempt login
      // ignore: unused_local_variable
      final userCredential = await AuthenticationRepository.instance.signInWithEmailAndPassword(
        email.text.trim(), 
        password.text.trim()
      );

      // Verify current user after login
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        EFullScreenLoader.stopLoading();
        ELoaders.errorSnackBar(
          title: 'Login Failed', 
          message: 'Unable to authenticate user. Please try again.'
        );
        return;
      }

      //Remove Loader
      EFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      // Stop loader
      EFullScreenLoader.stopLoading();
      
      // Show error message
      ELoaders.errorSnackBar(
        title: 'Login Error', 
        message: e.toString()
      );
    }
}
}