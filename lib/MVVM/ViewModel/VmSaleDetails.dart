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

  RxBool l_TextFieldsValidation = false.obs;

  RxString l_PrVmDID = ''.obs;

  String get Pr_txtVmDID_Text {
    return l_PrVmDID.value;
  }

  set Pr_txtVmDID_Text(String value) {
    l_PrVmDID.value = value;
  }

  RxString l_PrItem = ''.obs;

  String get Pr_txtItem_Text {
    return l_PrItem.value;
  }

  set Pr_txtItem_Text(String value) {
    l_PrItem.value = value;
  }

  RxInt l_PrQuantity = RxInt(0);

  int get Pr_txtQuantity_Text {
    return l_PrQuantity.value;
  }

  set Pr_txtQuantity_Text(int value) {
    l_PrQuantity.value = value;
  }

  RxInt l_PrRate = RxInt(0);

  int get Pr_txtRate_Text {
    return l_PrRate.value;
  }

  set Pr_txtRate_Text(int value) {
    l_PrRate.value = value;
  }

  RxInt l_PrTotal = RxInt(0);

  int get Pr_txtTotal_Text {
    return l_PrTotal.value;
  }

  set Pr_txtTotal_Text(int value) {
    l_PrTotal.value = value;
  }
  RxList<ModSaleDetails> G_ListItemQuery = <ModSaleDetails>[].obs;


  // Retrieve the ModSaleDB object from the existing instance of VmSale
  int? G_Operation;
  String? G_GUIDCustomer;

  Sb_ResetForm(){
    G_Operation = 1;
    G_GUIDCustomer = const Uuid().v4();
  }

  FncFill_SaleDetailsModel() {
    ModSaleDetails lModsaledetails = ModSaleDetails(); // Create a new instance

    //Get the filled Sale model instace
    ModSale? lModSale = l_VmSale?.Fnc_Set_Model_Main_Data();

    lModsaledetails.Pr_PKGUID = G_GUIDCustomer;
    lModsaledetails.Pr_Operation = G_Operation;
    lModsaledetails.Pr_VmDID = lModSale?.Pr_PKGUID;
    lModsaledetails.Pr_Item = Pr_txtItem_Text;
    lModsaledetails.Pr_Quantity = Pr_txtQuantity_Text;
    lModsaledetails.Pr_Rate = Pr_txtRate_Text;
    FncItemtotal(lModsaledetails);

    return lModsaledetails; // Return the instance
  }

  BTNInsert_Click() async {
    FncFillItemQuery();
    Sb_ResetForm();
  }

  BTNUpdate_Click(int lSelectedindex, ModSaleDetails lModsaledetailsdb   ) async {
    FncUpdateList (lSelectedindex ,lModsaledetailsdb);
  }

  FncFillItemQuery() {
    ModSaleDetails? lModsaledetailsdb = FncFill_SaleDetailsModel();
    G_ListItemQuery.add(lModsaledetailsdb!);
    FncCalculateItemTotal2();
  }
  FncCalculateItemTotal2() {
    int grandTotal = 0;
    G_ListItemQuery = BLPc().FncCalculateItemTotalAndGrandTotal2(G_ListItemQuery);
    VmSaleDetails? lVmsaledetails = Get.find<VmSaleDetails>();
    for (var item in G_ListItemQuery) {
      lVmsaledetails.Pr_txtItem_Text = item.Pr_ItemTotal.toString();
      grandTotal += item.Pr_ItemTotal!;
    }
    l_VmSale?.Pv_txtGrandTotal_Text = grandTotal;
    print("Done");
  }

  FncUpdateList(int lSelectedindex, ModSaleDetails lModsaledetailsdb) {
    if (lSelectedindex >= 0 && lSelectedindex < G_ListItemQuery.length) {
      G_ListItemQuery[lSelectedindex] = lModsaledetailsdb;
    }
    FncCalculateItemTotal2();
    G_ListItemQuery.refresh();
  }




  //this method is  responsible for claculation in dialog box
  FncSet_SalesDetailsModelData(ModSaleDetails lFilledsaledetailsmodel) {
    ModSaleDetails lModsaledetails = ModSaleDetails(); // Create a new instance

    if (lFilledsaledetailsmodel.Pr_Item != null) {
      lModsaledetails.Pr_Item = lFilledsaledetailsmodel.Pr_Item;
    }
    if (lFilledsaledetailsmodel.Pr_Quantity != null) {
      lModsaledetails.Pr_Quantity = lFilledsaledetailsmodel.Pr_Quantity;
    }
    if (lFilledsaledetailsmodel.Pr_Rate != null) {
      lModsaledetails.Pr_Rate = lFilledsaledetailsmodel.Pr_Rate;
    }

    FncItemtotal(lModsaledetails);
  }

  FncSaleUpdateDetailsModel(ModSaleDetails lModsaledetailsdb, CustomAlertDialog lCustomalertdialog) {
    lModsaledetailsdb.Pr_Operation = 2;
    lModsaledetailsdb.Pr_Item = lCustomalertdialog.l_Pr_ItemController.text;
    lModsaledetailsdb.Pr_Quantity = int.parse(lCustomalertdialog.l_Pr_QuantityController.text);
    lModsaledetailsdb.Pr_Rate = int.parse(lCustomalertdialog.l_Pr_RateController.text);
  }

  FncClearDialog(CustomAlertDialog lCustomalertdialog) {
    lCustomalertdialog.l_Pr_QuantityController.clear();
    lCustomalertdialog.l_Pr_ItemController.clear();
    lCustomalertdialog.l_Pr_RateController.clear();
    Pr_txtTotal_Text = 0;
  }

  //Calculate the model values
  FncItemtotal(ModSaleDetails lModsaledetailsdb) {
    lModsaledetailsdb = BLSaleDetails().FncItemTotal(lModsaledetailsdb);
    Pr_txtTotal_Text = lModsaledetailsdb.Pr_ItemTotal!;
  }
}
