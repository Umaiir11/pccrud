import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDB.dart';
import 'package:pccrud/MVVM/ViewModel/VmSale.dart';
import 'package:uuid/uuid.dart';
import '../Model/DB/ModSaleDetailsDB.dart';

class VmSingleMulti extends GetxController {
  VmSale? l_VmSale = Get.find<VmSale>();

  final TextEditingController l_Pr_nameController = TextEditingController();
  final TextEditingController l_Pr_CityController = TextEditingController();
  final TextEditingController l_Pr_CompanyController = TextEditingController();


  int? G_Operation;
  String? G_GUIDCustomer;
  String? Pv_txtVmDID_Text;
  RxBool l_TextFieldsValidation = false.obs;



  RxInt l_PrTotal = RxInt(0);

  RxList<ModSaleDetails> G_ListItemQuery = <ModSaleDetails>[].obs;


  // Retrieve the ModSaleDB object from the existing instance of VmSale


  Sb_ResetDetailsForm(){
    G_Operation = 1;
    G_GUIDCustomer = const Uuid().v4();
    l_Pr_CityController.text='';
    l_Pr_CompanyController.text = '';
    l_Pr_nameController.text='';
    //G_ListItemQuery.clear();
  }

  FncFill_SaleDetailsModel() {
    ModSaleDetails lModsaledetails = ModSaleDetails(); // Create a new instance

    //Get the filled Sale model instace
    ModSale? lModSale = l_VmSale?.Fnc_Set_Model_Main_Data();
    lModsaledetails.Pr_PKGUID = G_GUIDCustomer;
    lModsaledetails.Pr_Operation = G_Operation;
    lModsaledetails.Pr_VmDID = lModSale?.Pr_PKGUID;
    //lModsaledetails.Pr_Item = Pv_txtItem_Text;
   // lModsaledetails.Pr_Quantity = Pv_txtQuantity_Text;
   // lModsaledetails.Pr_Rate = Pv_txtRate_Text;
    //FncItemtotal(lModsaledetails);

    return lModsaledetails; // Return the instance
  }

  BTN_Add_Click() async {
    Sb_ResetDetailsForm();

    //Sb_ResetDetailsForm();
  }











  //Calculate the model values
}
