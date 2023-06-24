import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/DAL/DALSingleMulti.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDB.dart';
import 'package:pccrud/MVVM/Model/DB/ModSingleMulti.dart';
import 'package:pccrud/MVVM/ViewModel/VmSale.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import '../../BLSaleDetails/BLSingleMulti.dart';

class VmImage extends GetxController {
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


}
