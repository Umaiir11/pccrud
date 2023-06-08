import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:uuid/uuid.dart';

class VmDefineCustomer extends GetxController {
  RxBool l_TextFieldsValidation = false.obs;

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

  RxList<ModCustomerDetails> l_CustomerDetailsList = <ModCustomerDetails>[].obs;

  ModCustomerDetails? savedModCustomerDetails; // Variable to store the instance

  ModCustomerDetails FncFill_CustomerDetailsModel() {
    ModCustomerDetails l_ModCustomerDetails = ModCustomerDetails();
    String lUuid = const Uuid().v4();
    l_ModCustomerDetails.Pr_PKGUID = lUuid;
    l_ModCustomerDetails.Pr_CustID = Pr_txtCustID_Text;
    l_ModCustomerDetails.Pr_ISD = Pr_txtPr_ISD_Text;
    l_ModCustomerDetails.Pr_CB = Pr_txtPr_CB_Text;

    l_CustomerDetailsList.add(l_ModCustomerDetails);

    savedModCustomerDetails = l_ModCustomerDetails; // Save the instance

    return l_ModCustomerDetails;
  }

   FncClearData(  TextEditingController T1,TextEditingController T2 ){

     savedModCustomerDetails?.Pr_PKGUID = null;
     savedModCustomerDetails?.Pr_CustID = null;
     savedModCustomerDetails?.Pr_CB =null;
     savedModCustomerDetails?.Pr_ISD =null;
     savedModCustomerDetails?.Pr_Operation =null;

    T1.clear();
    T2.clear();


   }
}
