import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDB.dart';
import 'package:pccrud/MVVM/ViewModel/VmSale.dart';
import 'package:uuid/uuid.dart';

import '../../BLSaleDetails/BLDetails.dart';
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

 // RxInt l_PrChildOperation = RxInt(0);

  //int get Pr_txtChildOperation_Text {
  //  return l_PrChildOperation.value;
 // }

 // set Pr_txtChildOperation_Text(int value) {
  //  l_PrChildOperation.value = value;
 // }

  RxInt l_PrRate = RxInt(0);

  int get Pr_txtRate_Text {
    return l_PrRate.value;
  }

  set Pr_txtRate_Text(int value) {
    l_PrRate.value = value;

    // FncFillDetailsModel();
  }

  RxInt l_PrTotal = RxInt(0);

  int get Pr_txtTotal_Text {
    return l_PrTotal.value;
  }

  set Pr_txtTotal_Text(int value) {
    l_PrTotal.value = value;
  }

  // Retrieve the ModSaleDB object from the existing instance of VmSale

  FncFillDetailsModel() {
    ModSaleDetailsDB lModsaledetailsdb = ModSaleDetailsDB(); // Create a new instance

    // Rest of your code
    ModSale? lModsaledb = l_VmSale?.l_ModSale;
    String lUuid = const Uuid().v4();

    lModsaledetailsdb.Pr_PKGUID = lUuid;
    lModsaledetailsdb.Pr_Operation = 1;
    lModsaledetailsdb.Pr_VmDID = lModsaledb?.Pr_PKGUID;
    lModsaledetailsdb.Pr_Item = Pr_txtItem_Text;
    lModsaledetailsdb.Pr_Quantity = Pr_txtQuantity_Text;
    lModsaledetailsdb.Pr_Rate = Pr_txtRate_Text;
    // Rest of your code
    print(lModsaledetailsdb);
    FncItemtotal(lModsaledetailsdb);

    return lModsaledetailsdb; // Return the instance
  }

  FncUpdateDetailsModel(ModSaleDetailsDB lModsaledetailsdb, CustomAlertDialog lCustomalertdialog) {
    lModsaledetailsdb.Pr_Operation = 2;
    lModsaledetailsdb.Pr_Item = lCustomalertdialog.l_Pr_ItemController.text;
    lModsaledetailsdb.Pr_Quantity = int.parse(lCustomalertdialog.l_Pr_QuantityController.text);
    lModsaledetailsdb.Pr_Rate = int.parse(lCustomalertdialog.l_Pr_RateController.text);
  }

   FncsetModelData(ModSaleDetailsDB model) {
    ModSaleDetailsDB lModsaledetailsdb = ModSaleDetailsDB(); // Create a new instance

    if (model.Pr_Item != null) {
      lModsaledetailsdb.Pr_Item = model.Pr_Item;
    }
    if (model.Pr_Quantity != null) {
      lModsaledetailsdb.Pr_Quantity = model.Pr_Quantity;
    }
    if (model.Pr_Rate != null) {
      lModsaledetailsdb.Pr_Rate = model.Pr_Rate;
    }

    FncItemtotal(lModsaledetailsdb);
  }


  FncClearDialog(CustomAlertDialog lCustomalertdialog) {
    lCustomalertdialog.l_Pr_QuantityController.clear();
    lCustomalertdialog.l_Pr_ItemController.clear();
    lCustomalertdialog.l_Pr_RateController.clear();
    Pr_txtTotal_Text = 0;
  }

  FncItemtotal(ModSaleDetailsDB lModsaledetailsdb) {
    lModsaledetailsdb = BLSaleDetails().FncItemTotal(lModsaledetailsdb);
    Pr_txtTotal_Text = lModsaledetailsdb.Pr_ItemTotal!;
  }
}
