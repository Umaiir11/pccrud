import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';
import 'package:uuid/uuid.dart';

import 'Vm_Home.dart';

class VmCustomerDBList extends GetxController {

  VmDefineCustomer? lVmDefineCustomer = Get.find<VmDefineCustomer>();
  RxList<ModDefineCustomer> l_DefineCustomerListDB = <ModDefineCustomer>[].obs;

   FncReciveList(){
     l_DefineCustomerListDB = lVmDefineCustomer!.FncGetDefineCustomerList();
   }

  Future<bool> FncGetSelectedPKGUID(int index) async {
    String? l_SelectedPKGHUID = l_DefineCustomerListDB[index].Pr_PKGUID;
    int? l_SeletedIndex = index;

    if (l_SelectedPKGHUID != null) {
      return await lVmDefineCustomer!.FncSearchData(l_SelectedPKGHUID!, l_SeletedIndex!);
    }

    return false;
  }




}
