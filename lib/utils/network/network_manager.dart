import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// Manages the nekwork connectivity status and provide methods and handle connectivity changes
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  //Initialize the network manager and set up a stream to continually check the network status
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  //Update the connection status based on change in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    _connectionStatus.value = results.first;
    if (_connectionStatus.value == ConnectivityResult.none) {
      ELoaders.warningSnackBar(title: "No Internet Connection");
    }
  }

  //Check the internet connection status
  //Returns true if connected, 'false' otherwise
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      // Log the error for debugging
      //print('Error checking connectivity: $e');
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel(); // Ensure subscription is canceled
    super.onClose();
  }
}
