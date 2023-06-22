import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/DAL/DALSingleMulti.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDB.dart';
import 'package:pccrud/MVVM/Model/DB/ModSingleMulti.dart';
import 'package:pccrud/MVVM/ViewModel/VmSale.dart';
import 'package:uuid/uuid.dart';
import '../../BLSaleDetails/BLPc.dart';
import '../../BLSaleDetails/BLSingleMulti.dart';
import '../Model/DB/ModSaleDetailsDB.dart';

class VmSingleMulti extends GetxController {
  VmSale? l_VmSale = Get.find<VmSale>();

  final TextEditingController l_Pr_nameController = TextEditingController();
  final TextEditingController l_Pr_CityController = TextEditingController();
  final TextEditingController l_Pr_CompanyController = TextEditingController();
  final TextEditingController l_Pr_RateController = TextEditingController();
  final TextEditingController l_Pr_QuanController = TextEditingController();


  int? G_Operation;
  String? G_GUIDCustomer;
  RxBool l_TextFieldsValidation = false.obs;
  RxString l_PvItemTotal = ''.obs;
  RxInt l_PvGrandTotal = RxInt(0);



  RxInt l_PrTotal = RxInt(0);

  RxList<ModSingleMulti> G_ListModSingleMulti = <ModSingleMulti>[].obs;


  // Retrieve the ModSaleDB object from the existing instance of VmSale


  Sb_ResetDetailsForm(){
    G_Operation = 1;
    G_GUIDCustomer = const Uuid().v4();
    l_Pr_nameController.clear() ;
    l_Pr_CityController .clear() ;
    l_Pr_CompanyController.clear() ;
    l_Pr_RateController .clear() ;
    l_Pr_QuanController.clear();

    //G_ListItemQuery.clear();
  }

  Fnc_ClearForm(){

    G_ListModSingleMulti.clear();
     l_PvItemTotal.value  = '';
     l_PvGrandTotal.value = 0 ;
    Sb_ResetDetailsForm();

  }
  ModSingleMulti FncFill_SaleDetailsModel() {
    ModSingleMulti lModSingleMulti = ModSingleMulti(); // Create a new instance

    //Get the filled Sale model instace
    lModSingleMulti.Pr_PKGUID = G_GUIDCustomer;
    lModSingleMulti.Pr_Operation = G_Operation;
    lModSingleMulti.Pr_UserName = l_Pr_nameController.text;
    lModSingleMulti.Pr_UserCompany = l_Pr_CompanyController.text;
    lModSingleMulti.Pr_UserCity = l_Pr_CityController.text;
    lModSingleMulti.Pr_Quantity =  int.parse(l_Pr_QuanController.text) ;
    lModSingleMulti.Pr_Rate = int.parse(l_Pr_RateController.text) ;
    FncItemtotal(lModSingleMulti);
    return lModSingleMulti; // Return the instance
  }

  BTN_Add_Click() async {
     await FncFillItemQuery();
    Sb_ResetDetailsForm();
    //Sb_ResetDetailsForm();
  }

  BTN_Clear_Click() async {
     Fnc_ClearForm();
  }
  BTN_DBSave_Click() async {


  }





  Future<bool> Fnc_CUD() async {
    if (await DAL_SingleMulti().Fnc_Cud(G_ListModSingleMulti) == true) {
      return true;
    }
    return false;
  }

   FncFillItemQuery() async {
   ModSingleMulti l_ModSingleMulti = FncFill_SaleDetailsModel();
    G_ListModSingleMulti.add(l_ModSingleMulti!);
    FncCalculateItemTotall(G_ListModSingleMulti);
  }


  FncCalculateItemTotall(RxList<ModSingleMulti> l_ListModSingleMulti  ) {
    int grandTotal = 0;
    G_ListModSingleMulti = BLSingleMulti().FncCalculateItemTotalAndGrandTotal2(l_ListModSingleMulti);

    for (var item in G_ListModSingleMulti) {
      l_PvItemTotal.value =  item.Pr_Itemtotal.toString();
      grandTotal += item.Pr_Itemtotal!;
    }
    l_PvGrandTotal.value =  grandTotal;
    print("Done");
  }


  FncItemtotal(ModSingleMulti lModSingleMulti) {
    lModSingleMulti = BLSingleMulti().FncItemTotal(lModSingleMulti);
    l_PrTotal.value = lModSingleMulti.Pr_Itemtotal!;
  }

}
