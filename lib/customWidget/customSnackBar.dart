import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  void FncCustSnackBAR(String lTitle, String lMessage1, Color lColor1) {
    Get.snackbar(
      duration: const Duration(seconds: 1),
      lTitle,
      lMessage1,
      backgroundColor: lColor1,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
