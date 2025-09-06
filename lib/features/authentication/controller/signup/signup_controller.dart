import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:e_commerce/features/personalization/models/user_model.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/network/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  static SignupController instance = Get.find();

  //Variables
  final hidePassword = true.obs; //Observable for hidning/showing password
  final privacyCheck = true.obs; 
  final email = TextEditingController(); // Controller for email
  final password = TextEditingController(); // Controller for password
  final username = TextEditingController(); // Controller for username
  final lastName = TextEditingController(); // Controller for last name
  final firstName = TextEditingController(); // Controller for first name
  final phoneNumber = TextEditingController(); // Controller for phone number
  GlobalKey<FormState> signupformKey = GlobalKey<FormState>(); // Form key for validation

  //get firstnameController => null; 
  //--Sign Up
  void signup() async {
    try {
      // Start loading
      EFullScreenLoader.openLoadingDialog('We are processing your information....', EImage.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }
      print('Network connectivity checked: $isConnected');

      // Form Validation
      if (!signupformKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        print('Form validation failed');
        return;
      }

      // Privacy Policy Check
      if (!privacyCheck.value) {
        print('Privacy policy not accepted');
        EFullScreenLoader.stopLoading();
        ELoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message: "In order to create an account, you must accept the Privacy Policy & Terms of Use");
        return;
      }

      // Register user in Firebase Authentication
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      print('User registered: ${userCredential.user?.uid}');

      // Save user data to Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      try {
        // Save user data in Firestore
        final userRepository = Get.put(UserRepository());

        print('Attempting to save user data...');
        await userRepository.saveUserData(newUser);
        print('User data saved successfully.');
        } catch (e) {
        print('Firestore Error: $e'); // Log the specific Firestore error
        EFullScreenLoader.stopLoading();
        ELoaders.errorSnackBar(title: "Firestore Error", message: e.toString());
        return;
      }


      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Show success message
      ELoaders.successSnackBar(
          title: "Success", message: "Account Created Successfully. Please Verify your Email to Login");

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
      print('Navigating to VerifyEmailScreen');

    } catch (e) {
      EFullScreenLoader.stopLoading();
      print('Error: $e');
      ELoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}