import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController {
  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? image;
  Position? location;
  bool isLoading = false;
  captureImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 300,
    );
    if (pickedImage != null) {
      image = File(pickedImage.path);
      update();
    }
  }

  getLocation() async {
    isLoading = true;
    update();
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location service is not enabled
      Get.snackbar(
        'Location service is not enabled!',
        'Please enable location service',
      );
    } else {
      debugPrint('service is available');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission denied
        Get.snackbar('Location permission denied!',
            'Please provide the location permission');
      }
    } else {
      debugPrint('permission is available');
    }

    try {
      location = await Geolocator.getCurrentPosition();
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading = false;
    update();
    debugPrint(location.toString());
  }
}
