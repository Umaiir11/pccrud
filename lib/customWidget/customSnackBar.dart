import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  void FncCustSnackBAR(String lTitle, String l_Message1, String l_Message2, Color l_Color1,Color l_Color2 ) {
    Get.snackbar(
      lTitle,
      l_Message1,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.blue.withOpacity(0.9),
      colorText: Colors.white,
      borderRadius: 8,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutQuart,
      reverseAnimationCurve: Curves.easeInQuart,
      backgroundGradient: LinearGradient(
        colors: [l_Color1, l_Color2],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      overlayColor: Colors.black.withOpacity(0.3),
      overlayBlur: 5,
      shouldIconPulse: false,
      icon: AnimatedOpacity(
        duration: Duration(seconds: 3),
        opacity: 1.0,
        child: Icon(Icons.check, color: Colors.white),
      ),
      mainButton: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          'CLOSE',
          style: TextStyle(color: Colors.white),
        ),
      ),
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l_Message2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
