import 'package:get/get.dart';

class VmHome extends GetxController {


  RxString G_PKGUID = ''.obs;

  String get Pr_txtPKGUID {
    return G_PKGUID.value;
  }

  set Pr_txtPKGUID(String value) {
    G_PKGUID.value = value;
  }


  RxInt G_Operation = RxInt(1);

  int get Pr_txtOperatio {
    return G_Operation.value;
  }

  set Pr_txtOperatio(int value) {
    G_Operation.value = value;
  }
}
