import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';
import '../../DAL/DAL_DefineCust.dart';

class VmCustomerDBList extends GetxController {

  VmDefineCustomer? lVmDefineCustomer = Get.find<VmDefineCustomer>();
  RxList<ModDefineCustomer> l_RxListModDefineCustomer = <ModDefineCustomer>[].obs;



  Future<bool> FncGetSelectedPKGUID(int index) async {
    String? l_SelectedPKGHUID = l_RxListModDefineCustomer[index].Pr_PKGUID;
    if (l_SelectedPKGHUID != null) {
      return await lVmDefineCustomer!.Sb_SearchData(l_SelectedPKGHUID!) ?? true;
    }
    return false;
  }




  Future<bool> FetchDB_DATA() async {
    List<ModDefineCustomer> l_ListModDefineCustomer =await DAL_DefineCust().Fnc_ReadNew("");
    l_RxListModDefineCustomer.addAll(l_ListModDefineCustomer);
    return true;
  }
  }

