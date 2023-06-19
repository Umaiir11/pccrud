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

  RxList<ModSaleDetails> G_ListItemQuery = <ModSaleDetails>[].obs;

  RxBool l_TextFieldsValidation = false.obs;

//TextfieldsProp
  RxString l_PvCustID = ''.obs;

  String get Pv_txtCustID_Text {
    return l_PvCustID.value;
  }

  set Pv_txtCustID_Text(String value) {
    l_PvCustID.value = value;
  }

  RxString l_PvVoucher = ''.obs;

  String get Pv_txtVoucher_Text {
    return l_PvVoucher.value;
  }

  set Pv_txtVoucher_Text(String value) {
    l_PvVoucher.value = value;
  }

  RxInt l_PvGrandTotal = RxInt(0);

  int get Pv_txtGrandTotal_Text {
    return l_PvGrandTotal.value;
  }

  set Pv_txtGrandTotal_Text(int value) {
    l_PvGrandTotal.value = value;
  }
  Sb_ResetForm(){
    G_Operation = 1;
    G_GUIDCustomer = const Uuid().v4();
    Pv_txtCustID_Text ="";
    Pv_txtVoucher_Text= "";
    Pv_txtGrandTotal_Text=0 ;
    l_Pr_CustIDController.text="";
    l_Pr_VoucherController.text="";

  }
  Fnc_Set_Model_Main_Data() {
    ModSale lModsale = ModSale();
    lModsale.Pr_PKGUID = G_GUIDCustomer;
    lModsale.Pr_Operation = G_Operation;
    lModsale.Pr_CustID = l_Pr_CustIDController.text;
    lModsale.Pr_Voucher = l_Pr_VoucherController.text;
    lModsale.Pr_GrandTotal = Pv_txtGrandTotal_Text;
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
      lVmsaledetails.Pv_txtItem_Text = item.Pr_ItemTotal.toString();
    }
    Pv_txtGrandTotal_Text = l_ModPcSale.Pr_GrandTotal!;
    print("Done");
  }

  Future<bool> Fnc_CUD() async {
    ModPcSale l_ModPcSale = FncFillPCModelList();
    if (await DAL_PC().Fnc_Cud(l_ModPcSale) == true) {
      return true;
    }
    return false;
  }

  BTN_DBSave_Click() async {
    ModPcSale l_ModPcSale = FncFillPCModelList();
    FncCalculateItemTotal(l_ModPcSale);
    await Fnc_CUD();
  }



  FncNewForm(TextEditingController? T1, TextEditingController? T2,  ){
    VmHome? lVmHome = Get.find<VmHome>();
    lVmHome.Pr_txtOperatio = 1;
    lVmHome.Pr_txtPKGUID = const Uuid().v4();


    ModSale lModsale = Fnc_Set_Model_Main_Data();
    lModsale.Pr_Operation =  lVmHome.Pr_txtOperatio;
    lModsale.Pr_PKGUID = lVmHome.Pr_txtPKGUID;
    lModsale.Pr_CustID = '';
    lModsale.Pr_Voucher = '';
    lModsale.Pr_GrandTotal = 0;
    //l_Pr_CustIDController.text = '';
    //l_Pr_VoucherController.text ='';
    T1?.text = '';
    T2?.text = '';


    G_ListItemQuery.clear();

   // VmSaleDetails? lVmSaleDetails = Get.find<VmSaleDetails>();
    ModPcSale l_ModPcSale =  FncFillPCModelList();
    ModSaleDetails? lModsaledetailsdb = VmSaleDetails().FncFill_SaleDetailsModel();
    lModsaledetailsdb!.Pr_PKGUID = '';
    lModsaledetailsdb.Pr_Operation = 0;
    lModsaledetailsdb.Pr_Quantity = 0;
    lModsaledetailsdb.Pr_Rate = 0;
    lModsaledetailsdb.Pr_Item = '';
    lModsaledetailsdb.Pr_ItemTotal = 0;
    lModsaledetailsdb.Pr_VmDID = '';
    l_ModPcSale.Pr_Operation = 0;
    l_ModPcSale.Pr_PKGUID = '';
    l_ModPcSale.Pr_CustID = '';
    l_ModPcSale.Pr_Voucher = '';
    l_ModPcSale.Pr_GrandTotal = 0;
    l_ModPcSale.l_PCSaleDetailsDBList.clear();

    Pv_txtGrandTotal_Text = 0;
    Pv_txtCustID_Text ='';
    Pv_txtVoucher_Text = '';

    print("Data Clear");
  }


}
