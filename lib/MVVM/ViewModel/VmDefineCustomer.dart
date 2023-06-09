import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:uuid/uuid.dart';

import 'Vm_Home.dart';

class VmDefineCustomer extends GetxController {
  RxBool l_TextFieldsValidation = false.obs;

  RxList<ModDefineCustomer> l_DefineCustomerListDB = <ModDefineCustomer>[].obs;
  RxString l_PrPKGUID = ''.obs;

  String get Pr_txtPKGUID_Text {
    return l_PrPKGUID.value;
  }

  set Pr_txtPKGUID_Text(String value) {
    l_PrPKGUID.value = value;
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
 FncSearchData( String PKGUID  ){


 }



  FncNewForm(TextEditingController? T1, TextEditingController? T2,  ){
    VmHome? lVmHome = Get.find<VmHome>();
    lVmHome.Pr_txtOperatio = 1;
    lVmHome.Pr_txtPKGUID = const Uuid().v4();


    ModDefineCustomer l_ModDefineCustomer = FncFill_CustomerDetailsModel();
    l_ModDefineCustomer.Pr_Operation =  lVmHome.Pr_txtOperatio;
    l_ModDefineCustomer.Pr_PKGUID = lVmHome.Pr_txtPKGUID;
    l_ModDefineCustomer.Pr_CustID = '';
    l_ModDefineCustomer.Pr_ISD = '';
    l_ModDefineCustomer.Pr_CB = '';
    //l_Pr_CustIDController.text = '';
    //l_Pr_VoucherController.text ='';
    T1?.text = '';
    T2?.text = '';

  }


}
