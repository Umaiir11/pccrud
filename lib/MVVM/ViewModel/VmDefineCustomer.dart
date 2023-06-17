import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/DAL/DAL_DefineCust.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:uuid/uuid.dart';

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

  RxBool l_TextFieldsValidation = false.obs;



  ModDefineCustomer Fnc_Set_Model_Data() {
    ModDefineCustomer lModdefinecustomer = ModDefineCustomer();
    lModdefinecustomer.Pr_PKGUID = G_GUIDCustomer;
    lModdefinecustomer.Pr_CustID = l_CustIDController.text;
    lModdefinecustomer.Pr_CB = l_CBController.text;
    lModdefinecustomer.Pr_Operation = G_Operation;
    return lModdefinecustomer;
  }

  Future<bool> Fnc_CUD() async {
    ModDefineCustomer lModdefinecustomer = Fnc_Set_Model_Data();
      if(await DAL_DefineCust().Fnc_Cud(lModdefinecustomer) == true){
        return true;
      }
      return false;
    }


    Sb_SearchData(String lPkguid) async {
    String lWhereclause = "WHERE PKGUID = '$lPkguid'";

    List<ModDefineCustomer> lListmoddefinecustomer= await DAL_DefineCust().Fnc_Read(lWhereclause);
    ModDefineCustomer lModdefinecustomer = lListmoddefinecustomer.first;
    l_CBController.text = lModdefinecustomer.Pr_CB!;
    l_CustIDController.text =  lModdefinecustomer.Pr_CustID!;
    G_GUIDCustomer = lPkguid;
    G_Operation = 2;
  }

  BTNSave_Click() async {
     await Fnc_CUD();
       Sb_ResetForm();

  }

  BTNDelete_Click() async {
    G_Operation = 3;
    await Fnc_CUD();
    Sb_ResetForm();
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
