
import 'dart:convert';
import 'dart:io';

import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import 'package:permission_handler/permission_handler.dart';

class VmImage extends GetxController {

  RxString Pb_ImageString = RxString('');
  Rx<File?> G_compressedImage = Rx<File?>(null);
  RxInt G_compressedSize = 0.obs;
  RxString Pr_imageName = RxString('');

  Future<bool> FncPermissions() async {
    PermissionStatus l_mediaPermission = await Permission.photos.request();

    if (l_mediaPermission == PermissionStatus.granted) {
      return true;
    }

    if (l_mediaPermission == PermissionStatus.denied || l_mediaPermission == PermissionStatus.restricted) {
      return false;
    }

    if (l_mediaPermission == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }

    return false;
  }

  Future<bool> FncUserImage() async {
    ImagePicker picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File compressedImage = await FlutterNativeImage.compressImage(
        pickedFile.path,
        quality: 70,
        targetHeight: 500,
        targetWidth: 500,
      );

      int compressedSize = await compressedImage.length();
      G_compressedSize.value = compressedSize;
      //print('Compressed size: ${compressedSize ~/ 1024} KB');

      Pr_imageName.value = pickedFile.path.split('/').last;
      G_compressedImage.value = compressedImage;

      //ImageExtention
      String imageExtension = path.extension(pickedFile.path);
      print('File extension: $imageExtension');


      // Convert compressed image to a base64 string
      List<int> bytes = await compressedImage.readAsBytes();
      Pb_ImageString.value = base64Encode(bytes);
      // print('Base64 image: $base64Image');

      return true;
    }

    return false;
  }



}
