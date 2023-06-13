import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/DAL/DAL_DefineCust.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:uuid/uuid.dart';

import 'Vm_Home.dart';

class VmDefineCustomer extends GetxController {


  RxInt PrSeletecIndex = RxInt(-1);

  int get Pr_txtSeletecIndex {
    return PrSeletecIndex.value;
  }

  set Pr_txtSeletecIndex(int value) {
    PrSeletecIndex.value = value;
  }


  RxBool l_TextFieldsValidation = false.obs;

  RxList<ModDefineCustomer> l_DefineCustomerListDB = <ModDefineCustomer>[].obs;
  ModDefineCustomer? lExtractedModel;

  RxString l_PrPKGUID = ''.obs;

  String get Pr_txtPKGUID_Text {
    return l_PrPKGUID.value;
  }

  set Pr_txtPKGUID_Text(String value) {
    l_PrPKGUID.value = value;
  }
  RxString l_PrSelectedPKGUID = ''.obs;

  String get Pr_txtSelectedPKGUID_Text {
    return l_PrSelectedPKGUID.value;
  }

  set Pr_txtSelectedPKGUID_Text(String value) {
    l_PrSelectedPKGUID.value = value;
  }

  RxString l_PrCustID = ''.obs;

  String get Pr_txtCustID_Text {
    return l_PrCustID.value;
  }

  set Pr_txtCustID_Text(String value) {
    l_PrCustID.value = value;
  }

  RxString l_PrPr_CB = ''.obs;

  String get Pr_txtPr_CB_Text {
    return l_PrPr_CB.value;
  }

  set Pr_txtPr_CB_Text(String value) {
    l_PrPr_CB.value = value;
  }

  RxString l_Pr_ISD = ''.obs;

  String get Pr_txtPr_ISD_Text {
    return l_Pr_ISD.value;
  }

  set Pr_txtPr_ISD_Text(String value) {
    l_Pr_ISD.value = value;
  }

  // Retrieve the ModSaleDB object from the existing instance of VmSale

  RxList<ModDefineCustomer> l_DefineCustomerList = <ModDefineCustomer>[].obs;

  ModDefineCustomer? G_savedModDefineCustomer; // Variable to store the instance

  ModDefineCustomer FncFill_CustomerDetailsModel() {
    ModDefineCustomer l_ModDefineCustomer = ModDefineCustomer();
    String lUuid = const Uuid().v4();
    VmHome? lVmHome = Get.find<VmHome>();
    lVmHome.Pr_txtOperatio = 1;
    l_ModDefineCustomer.Pr_Operation =lVmHome.Pr_txtOperatio;
    l_ModDefineCustomer.Pr_PKGUID = lUuid;
    l_ModDefineCustomer.Pr_CustID = Pr_txtCustID_Text;
    l_ModDefineCustomer.Pr_ISD = Pr_txtPr_ISD_Text;
    l_ModDefineCustomer.Pr_CB = Pr_txtPr_CB_Text;
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
    Pr_txtSelectedPKGUID_Text = l_PKGUID;
    String l_WhereClause = "WHERE PKGUID = '${Pr_txtSelectedPKGUID_Text}'";
    return await DAL_DefineCust().Fnc_Read(G_savedModDefineCustomer!,l_WhereClause);
  }

  Future<bool> FncDelDATA() async {
    final VmHome? lVmHome = Get.find<VmHome>();
    G_savedModDefineCustomer?.Pr_ISD = 'false';
   // G_savedModDefineCustomer?.Pr_Operation = lVmHome?.Pr_txtOperatio = 4;

    if (Pr_txtSelectedPKGUID_Text.isNotEmpty) {
      try {
        await DAL_DefineCust().Fnc_Cud(G_savedModDefineCustomer!);
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


    ModDefineCustomer l_ModDefineCustomer = FncFill_CustomerDetailsModel();
    l_ModDefineCustomer.Pr_Operation =  lVmHome.Pr_txtOperatio;
    l_ModDefineCustomer.Pr_PKGUID = lVmHome.Pr_txtPKGUID;
    l_ModDefineCustomer.Pr_CustID = '';
    l_ModDefineCustomer.Pr_ISD = Pr_txtPr_ISD_Text ='true';

    l_ModDefineCustomer.Pr_CB = '';
    //l_Pr_CustIDController.text = '';
    //l_Pr_VoucherController.text ='';
    T1?.text = '';
    T2?.text = '';

  }


}
