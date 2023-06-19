import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/BLSaleDetails/BLPc.dart';
import 'package:pccrud/DAL/DAL_PC.dart';
import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';
import 'package:pccrud/MVVM/ViewModel/VmSaleDetails.dart';
import 'package:uuid/uuid.dart';

import '../Model/DB/ModSaleDB.dart';
import '../Model/DB/ModSaleDetailsDB.dart';
import 'Vm_Home.dart';

class VmSale extends GetxController {

  final TextEditingController l_Pr_CustIDController = TextEditingController();
  final TextEditingController l_Pr_VoucherController = TextEditingController();

  int? G_Operation;
  String? G_GUIDCustomer;

  RxBool l_TextFieldsValidation = false.obs;

//TextfieldsProp

  RxInt l_PvGrandTotal = RxInt(0);

  Sb_ResetMainForm(){
    G_Operation = 1;
    G_GUIDCustomer = const Uuid().v4();
    l_PvGrandTotal.value=0 ;
    l_Pr_CustIDController.text="";
    l_Pr_VoucherController.text="";

  }
  Fnc_Set_Model_Main_Data() {
    ModSale lModsale = ModSale();
    lModsale.Pr_PKGUID = G_GUIDCustomer;
    lModsale.Pr_Operation = G_Operation;
    lModsale.Pr_CustID = l_Pr_CustIDController.text;
    lModsale.Pr_Voucher = l_Pr_VoucherController.text;
    lModsale.Pr_GrandTotal = l_PvGrandTotal.value;
    return lModsale;
  }



//========================================================PC=====================================================================

  FncFillPCModelList() {
    ModPcSale l_ModPcSale = ModPcSale();

    ModSale lModsale = Fnc_Set_Model_Main_Data();
    l_ModPcSale.Pr_PKGUID = lModsale.Pr_PKGUID;
    l_ModPcSale.Pr_Operation = lModsale.Pr_Operation;
    l_ModPcSale.Pr_CustID = lModsale.Pr_CustID;
    l_ModPcSale.Pr_Voucher = lModsale.Pr_Voucher;
    l_ModPcSale.Pr_GrandTotal = lModsale.Pr_GrandTotal;

    VmSaleDetails? lVmsaledetails = Get.find<VmSaleDetails>();
    l_ModPcSale.l_PCSaleDetailsDBList.addAll(lVmsaledetails.G_ListItemQuery);

    return l_ModPcSale;
  }

  FncCalculateItemTotal(ModPcSale l_ModPcSale) {
    l_ModPcSale = BLPc().FncCalculateItemTotalAndGrandTotal(l_ModPcSale);
    VmSaleDetails? lVmsaledetails = Get.find<VmSaleDetails>();
    for (var item in l_ModPcSale.l_PCSaleDetailsDBList) {
      lVmsaledetails.l_Pr_RateController.text = item.Pr_ItemTotal.toString();
    }
    l_PvGrandTotal.value = l_ModPcSale.Pr_GrandTotal!;
    print("Done");
  }

  Future<bool> Fnc_CUD() async {
    ModPcSale l_ModPcSale = FncFillPCModelList();
    if (await DAL_PC().Fnc_Cud(l_ModPcSale) == true) {
      return true;
    }
    return false;
  }
  Sb_Reset_PCForm(){

    l_PvGrandTotal.value=0 ;
    l_Pr_CustIDController.text="";
    l_Pr_VoucherController.text="";
    ModPcSale l_ModPcSale =  FncFillPCModelList();
    l_ModPcSale.Pr_Operation = 0;
    l_ModPcSale.Pr_PKGUID = "";
    l_ModPcSale.Pr_CustID = '';
    l_ModPcSale.Pr_Voucher = '';
    l_ModPcSale.Pr_GrandTotal = 0;
    l_ModPcSale.l_PCSaleDetailsDBList.clear();

    l_PvGrandTotal.value = 0;
    print("Data Clear");
  }



  BTN_DBSave_Click() async {
    ModPcSale l_ModPcSale = FncFillPCModelList();
    FncCalculateItemTotal(l_ModPcSale);
    await Fnc_CUD();
    Sb_ResetMainForm();
    Sb_Reset_PCForm();
    VmSaleDetails? lVmsaledetails = Get.find<VmSaleDetails>();
    lVmsaledetails.Sb_ResetDetailsForm();
  }
  BTN_Clear_Click() async {
    VmSaleDetails? lVmsaledetails = Get.find<VmSaleDetails>();
    Sb_ResetMainForm();
    lVmsaledetails.Sb_ResetDetailsForm();
    Sb_Reset_PCForm();

  }


}
