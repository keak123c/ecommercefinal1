import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/onboading.dart';
import 'package:e_commerce/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/exception/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/exception/firebase_exceptions.dart';
import 'package:e_commerce/utils/exception/format_exceptions.dart';
import 'package:e_commerce/utils/exception/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //Called from main.dart an app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //Function to save Relevant screen
  screenRedirect() async{
    final user = _auth.currentUser; 
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      //Local Storage
      deviceStorage.writeIfNull("IsFirstTime", true);
      //check if its the first time launching the app
      deviceStorage.read("IsFirstTime") != true 
        ? Get.offAll(() => const LoginScreen()) 
        : Get.offAll(() => const OnBoardingScreen());
    }
  }

  //----------------------Email & Password----------------------

  //Email AUthentication - signin
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  //Email Authentication - register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  //[ReAuthenticate] - ReAuthenticate User
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification(); 
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  //[EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email); 
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  //-------------Federated identity & social sign-in------------

  //[GoogleAuthentication] - GOOGLE

  //[FacebookAuthentication] - FACEBOOK

  //----------.?end Federated identity & social sign-in ---------

  // [LogoutUser] - Valid for any authentication

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut(); 
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  // [DeleteUser] - Remove user Auth and Firestore Account
  
  //check the token expiration date
  Future<void> checkTokenExpiration() async {
  try {
    User? user = _auth.currentUser;
    if (user != null) {
      // Get token result
      IdTokenResult tokenResult = await user.getIdTokenResult();
      
      // Print expiration details
      print('Token Issued At: ${tokenResult.issuedAtTime}');
      print('Token Expiration: ${tokenResult.expirationTime}');
      
      // Check if token is expired
      final now = DateTime.now();
      if (tokenResult.expirationTime!.isBefore(now)) {
        print('Token has EXPIRED');
      } else {
        print('Token is still valid');
      }
    } else {
      print('No current user');
    }
  } catch (e) {
    print('Error checking token expiration: $e');
  }
}
}