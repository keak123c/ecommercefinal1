import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  //Todo: add Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //Todo: Init Local Storage
  await GetStorage.init();
  //Todo: Await Native Splash until items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //Todo: Initializa Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //Todo: Initializa Authentication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  
  runApp(
    DevicePreview(
      enabled: true,  // Set to false for production
      builder: (context) => const MyApp(),
    ),
  );
}