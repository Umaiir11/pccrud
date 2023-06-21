import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDB.dart';
import 'package:pccrud/MVVM/ViewModel/VmSale.dart';
import 'package:uuid/uuid.dart';

import '../../BLSaleDetails/BLDetails.dart';
import '../../BLSaleDetails/BLPc.dart';
import '../../customWidget/customShowDialog.dart';
import '../Model/DB/ModSaleDetailsDB.dart';

class VmSaleDetails extends GetxController {
  VmSale? l_VmSale = Get.find<VmSale>();

  final TextEditingController l_Pr_ItemController = TextEditingController();
  final TextEditingController l_Pr_QuantityController = TextEditingController();
  final TextEditingController l_Pr_RateController = TextEditingController();


  int? G_Operation;
  String? G_GUIDCustomer;
  String? Pv_txtVmDID_Text;
  RxBool l_TextFieldsValidation = false.obs;



  RxString l_PvItem = ''.obs;
  String get Pv_txtItem_Text {
    return l_PvItem.value;
  }
  set Pv_txtItem_Text(String value) {
    l_PvItem.value = value;
  }

  RxInt l_PvQuantity = RxInt(0);
  int get Pv_txtQuantity_Text {
    return l_PvQuantity.value;
  }
  set Pv_txtQuantity_Text(int value) {
    l_PvQuantity.value = value;
  }

  RxInt l_PvRate = RxInt(0);
  int get Pv_txtRate_Text {
    return l_PvRate.value;
  }
  set Pv_txtRate_Text(int value) {
    l_PvRate.value = value;
  }

  RxInt l_PrTotal = RxInt(0);

  RxList<ModSaleDetails> G_ListItemQuery = <ModSaleDetails>[].obs;


  // Retrieve the ModSaleDB object from the existing instance of VmSale


  Sb_ResetDetailsForm(){
    G_Operation = 1;
    G_GUIDCustomer = const Uuid().v4();
    l_Pr_QuantityController.text='';
    l_Pr_RateController.text = '';
    l_Pr_ItemController.text='';
    //G_ListItemQuery.clear();
  }

  FncFill_SaleDetailsModel() {
    ModSaleDetails lModsaledetails = ModSaleDetails(); // Create a new instance

    //Get the filled Sale model instace
    ModSale? lModSale = l_VmSale?.Fnc_Set_Model_Main_Data();
    lModsaledetails.Pr_PKGUID = G_GUIDCustomer;
    lModsaledetails.Pr_Operation = G_Operation;
    lModsaledetails.Pr_VmDID = lModSale?.Pr_PKGUID;
    lModsaledetails.Pr_Item = Pv_txtItem_Text;
    lModsaledetails.Pr_Quantity = Pv_txtQuantity_Text;
    lModsaledetails.Pr_Rate = Pv_txtRate_Text;
    FncItemtotal(lModsaledetails);

    return lModsaledetails; // Return the instance
  }

  BTN_Add_Click() async {
    Sb_ResetDetailsForm();
    FncFillItemQuery();
    FncClearDialog();
    //Sb_ResetDetailsForm();
  }
  BTN_Update_Click(int lSelectedindex ) async {
    ModSaleDetails l_ModSaleDetails = FncFill_SaleDetailsModel();
    ModSaleDetails  l_ModSaleDetailsUpdate  =   FncSaleUpdateDetailsModel(l_ModSaleDetails);
    FncUpdateList (lSelectedindex ,l_ModSaleDetailsUpdate);
  }
  BTN_Delete_Click(int lSelectedindex) {
    ModSaleDetails l_ModSaleDetails  = G_ListItemQuery[lSelectedindex];
    l_VmSale?.l_PvGrandTotal.value -= l_ModSaleDetails.Pr_ItemTotal!;
    G_ListItemQuery.removeAt(lSelectedindex);
}




  FncFillItemQuery() {
    ModSaleDetails? lModsaledetailsdb = FncFill_SaleDetailsModel();
    G_ListItemQuery.add(lModsaledetailsdb!);
    FncCalculateItemTotall();
  }


  FncCalculateItemTotall() {
    int grandTotal = 0;
    G_ListItemQuery = BLPc().FncCalculateItemTotalAndGrandTotal2(G_ListItemQuery);
    VmSaleDetails? lVmsaledetails = Get.find<VmSaleDetails>();
    for (var item in G_ListItemQuery) {
      lVmsaledetails.Pv_txtItem_Text = item.Pr_ItemTotal.toString();
      grandTotal += item.Pr_ItemTotal!;
    }
    l_VmSale?.l_PvGrandTotal.value = grandTotal;
    print("Done");
  }
  FncUpdateList(int lSelectedindex, ModSaleDetails lModsaledetails) {
    if (lSelectedindex >= 0 && lSelectedindex < G_ListItemQuery.length) {
      G_ListItemQuery[lSelectedindex] = lModsaledetails;
    }
    FncCalculateItemTotall();
    G_ListItemQuery.refresh();
  }
  ModSaleDetails FncSaleUpdateDetailsModel(ModSaleDetails lModsaledetails) {
     G_Operation = 2;
    lModsaledetails.Pr_Item = l_Pr_ItemController.text;
    lModsaledetails.Pr_Quantity = int.parse(l_Pr_QuantityController.text);
    lModsaledetails.Pr_Rate = int.parse(l_Pr_RateController.text);

    return lModsaledetails;
  }



  FncClearDialog() {
    l_Pr_QuantityController.clear();
    l_Pr_ItemController.clear();
    l_Pr_RateController.clear();
    l_PrTotal.value = 0;
  }

  //Calculate the model values
  FncItemtotal(ModSaleDetails lModsaledetailsdb) {
    lModsaledetailsdb = BLSaleDetails().FncItemTotal(lModsaledetailsdb);
    l_PrTotal.value = lModsaledetailsdb.Pr_ItemTotal!;
  }
}
