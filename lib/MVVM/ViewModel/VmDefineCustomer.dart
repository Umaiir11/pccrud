import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/DAL/DAL_DefineCust.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:uuid/uuid.dart';

import 'Vm_Home.dart';

class VmDefineCustomer extends GetxController {


  final TextEditingController l_CustIDController = TextEditingController();
  final TextEditingController l_CBController = TextEditingController();


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

  RxString Text_TEst = ''.obs;

  int? G_Operation;
  String? G_GUIDCustomer;

  //RxList<ModDefineCustomer> l_DefineCustomerList = <ModDefineCustomer>[].obs;

  RxBool l_TextFieldsValidation = false.obs;



  ModDefineCustomer Fnc_Set_Model_Data() {
    ModDefineCustomer l_ModDefineCustomer = ModDefineCustomer();

    l_ModDefineCustomer.Pr_PKGUID = G_GUIDCustomer;
    l_ModDefineCustomer.Pr_CustID = l_CustIDController.text;
    l_ModDefineCustomer.Pr_CB = l_CBController.text;
    l_ModDefineCustomer.Pr_Operation = G_Operation;
    if (G_Operation == 3 ) {
      l_ModDefineCustomer.Pr_ISD = "True";
    }
    return l_ModDefineCustomer;
  }

  Future<bool> Fnc_CUD() async {
    ModDefineCustomer l_ModDefineCustomer = Fnc_Set_Model_Data();
      await DAL_DefineCust().Fnc_Cud(l_ModDefineCustomer!);
      return true;
    }


    Sb_SearchData(String l_PKGUID) async {
    String l_WhereClause = "WHERE PKGUID = '${l_PKGUID}'";

    List<ModDefineCustomer> l_ListModDefineCustomer= await DAL_DefineCust().Fnc_ReadNew(l_WhereClause);
    ModDefineCustomer l_ModDefineCustomer = l_ListModDefineCustomer.first;
    l_CBController.text = l_ModDefineCustomer.Pr_CB!;
    l_CustIDController.text =  l_ModDefineCustomer.Pr_CustID!;
    G_GUIDCustomer = l_PKGUID;




    G_Operation = 2;

    //l_ModDefineCustomer =
  }

  BTNSave_Click(){
    Fnc_CUD();
    Sb_ResetForm();
  }

  BTNDelete_Click(){
    G_Operation = 3;
    Fnc_CUD();
  }

  BTNClear_Click(){
    Sb_ResetForm( );


  }


  Sb_ResetForm(){
    G_Operation = 1;
    G_GUIDCustomer = const Uuid().v4();
    Pv_txtCustID_Text ="";
    Pv_txtCB_Text= "";
    l_CustIDController.text="";
    l_CBController.text="";

  }



}
