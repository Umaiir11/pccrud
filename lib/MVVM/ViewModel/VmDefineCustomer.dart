import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/DAL/DAL_DefineCust.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:uuid/uuid.dart';

import 'Vm_Home.dart';

class VmDefineCustomer extends GetxController {


  RxBool l_TextFieldsValidation = false.obs;

  RxList<ModDefineCustomer> l_DefineCustomerListDB = <ModDefineCustomer>[].obs;
  ModDefineCustomer? lExtractedModel;
  String? l_SelectedPKGUID ;
  RxList<ModDefineCustomer> l_DefineCustomerList = <ModDefineCustomer>[].obs;
  ModDefineCustomer? G_savedModDefineCustomer; // Variable to store the instance


  RxString l_PvCustID = ''.obs;

  String get Pv_txtCustID_Text {
    return l_PvCustID.value;
  }

  set Pv_txtCustID_Text(String value) {
    l_PvCustID.value = value;
  }

  RxString l_PvCB = ''.obs;

  String get Pv_txtCB_Text {
    return l_PvCB.value;
  }

  set Pv_txtCB_Text(String value) {
    l_PvCB.value = value;
  }

  RxString l_PvISD = ''.obs;

  String get Pv_txtISD_Text {
    return l_PvISD.value;
  }

  set Pv_txtISD_Text(String value) {
    l_PvISD.value = value;
  }

  ModDefineCustomer Fnc_Set_Model_Data() {
    ModDefineCustomer l_ModDefineCustomer = ModDefineCustomer();
    String lUuid =  const Uuid().v4();
    VmHome? lVmHome = Get.find<VmHome>();
    lVmHome.Pr_txtOperatio = 1;
    l_ModDefineCustomer.Pr_Operation =lVmHome.Pr_txtOperatio;
    l_ModDefineCustomer.Pr_PKGUID = lUuid;
    l_ModDefineCustomer.Pr_CustID = Pv_txtCustID_Text;
    l_ModDefineCustomer.Pr_ISD = Pv_txtISD_Text;
    l_ModDefineCustomer.Pr_CB = Pv_txtCB_Text;
    l_DefineCustomerList.add(l_ModDefineCustomer);

    G_savedModDefineCustomer = l_ModDefineCustomer; // Save the instance

    return l_ModDefineCustomer;
  }

  RxList<ModDefineCustomer> FncGetDefineCustomerList() {
    if (l_DefineCustomerListDB.isEmpty) {
      print('List is empty');
    }
    return l_DefineCustomerListDB;
  }

  Future<bool> FncSearchData(String l_PKGUID) async {
    final VmHome? lVmHome = Get.find<VmHome>();
    G_savedModDefineCustomer?.Pr_Operation = lVmHome?.Pr_txtOperatio = 3;
    l_SelectedPKGUID = l_PKGUID;
    String l_WhereClause = "WHERE PKGUID = '${l_SelectedPKGUID}'";
    return await DAL_DefineCust().Fnc_Read(G_savedModDefineCustomer!,l_WhereClause);
  }

  Future<bool> FncDelDATA() async {
    G_savedModDefineCustomer?.Pr_ISD = 'false';
    if (l_SelectedPKGUID!.isNotEmpty) {
      try {
        await DAL_DefineCust().Fnc_Cud(G_savedModDefineCustomer!);
        final VmHome? lVmHome = Get.find<VmHome>();
        G_savedModDefineCustomer?.Pr_Operation = lVmHome?.Pr_txtOperatio = 1;
        return true;

      } catch (e) {
        print("Error deleting data: $e");
        return false;
      }
    }

    return false;
  }



  FncNewForm(TextEditingController? T1, TextEditingController? T2,){
    VmHome? lVmHome = Get.find<VmHome>();
    lVmHome.Pr_txtOperatio = 1;
    lVmHome.Pr_txtPKGUID = const Uuid().v4();
    l_DefineCustomerListDB.clear();
    l_DefineCustomerList.clear();

    ModDefineCustomer l_ModDefineCustomer = Fnc_Set_Model_Data();
    l_ModDefineCustomer.Pr_Operation =  lVmHome.Pr_txtOperatio;
    l_ModDefineCustomer.Pr_PKGUID = lVmHome.Pr_txtPKGUID;
    l_ModDefineCustomer.Pr_CustID = '';
    l_ModDefineCustomer.Pr_ISD = Pv_txtISD_Text ='true';
    lExtractedModel?.Pr_CustID='';
    lExtractedModel?.Pr_CB='';


    l_ModDefineCustomer.Pr_CB = '';
    T1?.text = '';
    T2?.text = '';

  }


}
