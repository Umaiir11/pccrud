import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/BLSaleDetails/BLPc.dart';
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
  RxBool l_HideItem = false.obs;
  String? l_Uuid;

//TextfieldsProp
  RxString l_PrCustID = ''.obs;

  String get Pr_txtCustID_Text {
    return l_PrCustID.value;
  }

  set Pr_txtCustID_Text(String value) {
    l_PrCustID.value = value;
  }

  RxString l_PrVoucher = ''.obs;

  String get Pr_txtVoucher_Text {
    return l_PrVoucher.value;
  }

  set Pr_txtVoucher_Text(String value) {
    l_PrVoucher.value = value;
  }

  RxInt l_PrGrandTotal = RxInt(0);

  int get Pr_txtGrandTotal_Text {
    return l_PrGrandTotal.value;
  }

  set Pr_txtGrandTotal_Text(int value) {
    l_PrGrandTotal.value = value;
  }


  Sb_ResetForm(){
    G_Operation = 1;
    G_GUIDCustomer = const Uuid().v4();
    Pr_txtCustID_Text ="";
    Pr_txtVoucher_Text= "";
    Pr_txtGrandTotal_Text=0 ;
    l_Pr_CustIDController.text="";
    l_Pr_VoucherController.text="";

  }



  FncFill_SaleModel() {
    ModSale lModsale = ModSale();
    lModsale.Pr_PKGUID = G_GUIDCustomer;
    lModsale.Pr_Operation = G_Operation;
    lModsale.Pr_CustID = l_Pr_CustIDController.text;
    lModsale.Pr_Voucher = l_Pr_VoucherController.text;
    lModsale.Pr_GrandTotal = Pr_txtGrandTotal_Text;
    return lModsale;
  }

  FncFillItemQuery() {
    VmSaleDetails? lVmsaledetails = Get.find<VmSaleDetails>();
    ModSaleDetails? lModsaledetailsdb = lVmsaledetails.FncFill_SaleDetailsModel();
    G_ListItemQuery.add(lModsaledetailsdb!);
    FncCalculateItemTotal2();
  }

  FncUpdateList(int lSelectedindex, ModSaleDetails lModsaledetailsdb) {
    if (lSelectedindex >= 0 && lSelectedindex < G_ListItemQuery.length) {
      G_ListItemQuery[lSelectedindex] = lModsaledetailsdb;
    }
    FncCalculateItemTotal2();
    G_ListItemQuery.refresh();
  }

  FncCalculateItemTotal2() {
    int grandTotal = 0;
    G_ListItemQuery = BLPc().FncCalculateItemTotalAndGrandTotal2(G_ListItemQuery);
    VmSaleDetails? lVmsaledetails = Get.find<VmSaleDetails>();
    for (var item in G_ListItemQuery) {
      lVmsaledetails.Pr_txtItem_Text = item.Pr_ItemTotal.toString();
      grandTotal += item.Pr_ItemTotal!;
    }
    Pr_txtGrandTotal_Text = grandTotal;
    print("Done");
  }


//========================================================PC=====================================================================

  ModPcSale l_ModPcSale = ModPcSale();

  FncFillPCModelList() {
    ModSale lModsale = FncFill_SaleModel();
    l_ModPcSale.Pr_PKGUID = lModsale.Pr_PKGUID;
    l_ModPcSale.Pr_Operation = lModsale.Pr_Operation;
    l_ModPcSale.Pr_CustID = lModsale.Pr_CustID;
    l_ModPcSale.Pr_Voucher = lModsale.Pr_Voucher;
    l_ModPcSale.Pr_GrandTotal = lModsale.Pr_GrandTotal;
    //Get the filled SaleDetailsModel and add to the list
    ///VmSaleDetails? lVmsaledetails = Get.find<VmSaleDetails>();
    //ModSaleDetails? lModsaledetailsdb = lVmsaledetails.FncFill_SaleDetailsModel();
    l_ModPcSale.l_PCSaleDetailsDBList.addAll(G_ListItemQuery);
    // print(l_ModPcSale.l_PCSaleDetailsDBList);
    FncCalculateItemTotal();
  }

  //Calculation each item total by BLPC .
  FncCalculateItemTotal() {
    l_ModPcSale = BLPc().FncCalculateItemTotalAndGrandTotal(l_ModPcSale);
    VmSaleDetails? lVmsaledetails = Get.find<VmSaleDetails>();
    for (var item in l_ModPcSale.l_PCSaleDetailsDBList) {
      lVmsaledetails.Pr_txtItem_Text = item.Pr_ItemTotal.toString();
    }
    Pr_txtGrandTotal_Text = l_ModPcSale.Pr_GrandTotal!;
    print("Done");
  }



  FncNewForm(TextEditingController? T1, TextEditingController? T2,  ){
    VmHome? lVmHome = Get.find<VmHome>();
    lVmHome.Pr_txtOperatio = 1;
    lVmHome.Pr_txtPKGUID = const Uuid().v4();


    ModSale lModsale = FncFill_SaleModel();
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

    Pr_txtGrandTotal_Text = 0;
    Pr_txtCustID_Text ='';
    Pr_txtVoucher_Text = '';

    print("Data Clear");
  }


}
