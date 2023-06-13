import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  void FncCustSnackBAR(String lTitle, String l_Message1, Color l_Color1) {
    Get.snackbar(
      duration: Duration(seconds: 1),
      lTitle,
      l_Message1,
      backgroundColor: l_Color1,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
