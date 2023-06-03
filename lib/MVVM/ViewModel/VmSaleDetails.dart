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

  RxInt l_PrChildOperation = RxInt(0);

  int get Pr_txtChildOperation_Text {
    return l_PrChildOperation.value;
  }

  set Pr_txtChildOperation_Text(int value) {
    l_PrChildOperation.value = value;
  }

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
    ModSaleDetailsDB l_ModSaleDetailsDB = ModSaleDetailsDB(); // Create a new instance

    // Rest of your code
    ModSaleDB? l_ModSaleDB = l_VmSale?.l_ModSaleDB;
    String l_Uuid = const Uuid().v4();

    l_ModSaleDetailsDB.Pr_PKGUID = l_Uuid;
    l_ModSaleDetailsDB.Pr_Operation = Pr_txtChildOperation_Text;
    l_ModSaleDetailsDB.Pr_VmDID = l_ModSaleDB?.Pr_PKGUID;
    l_ModSaleDetailsDB.Pr_Item = Pr_txtItem_Text;
    l_ModSaleDetailsDB.Pr_Quantity = Pr_txtQuantity_Text;
    l_ModSaleDetailsDB.Pr_Rate = Pr_txtRate_Text;
    // Rest of your code
    print(l_ModSaleDetailsDB);
    FncItemtotal(l_ModSaleDetailsDB);

    return l_ModSaleDetailsDB; // Return the instance
  }

  void FncsetModelData(ModSaleDetailsDB model) {
    ModSaleDetailsDB l_ModSaleDetailsDB = ModSaleDetailsDB(); // Create a new instance

    if (model.Pr_Item != null) {
      l_ModSaleDetailsDB.Pr_Item = model.Pr_Item;
    }
    if (model.Pr_Quantity != null) {
      l_ModSaleDetailsDB.Pr_Quantity = model.Pr_Quantity;
    }
    if (model.Pr_Rate != null) {
      l_ModSaleDetailsDB.Pr_Rate = model.Pr_Rate;
    }

    FncItemtotal(l_ModSaleDetailsDB);
  }


  FncUpdateDetailsModel( ModSaleDetailsDB l_ModSaleDetailsDB, CustomAlertDialog l_CustomAlertDialog  ){

    l_ModSaleDetailsDB.Pr_Item = l_CustomAlertDialog.l_Pr_ItemController.text;
    l_ModSaleDetailsDB.Pr_Quantity = int.parse(l_CustomAlertDialog.l_Pr_QuantityController.text);
    l_ModSaleDetailsDB.Pr_Rate = int.parse(l_CustomAlertDialog.l_Pr_RateController.text);
  }
  FncClearDialog(  CustomAlertDialog l_CustomAlertDialog  ){
  l_CustomAlertDialog.l_Pr_QuantityController.clear();
  l_CustomAlertDialog.l_Pr_ItemController.clear();
  l_CustomAlertDialog.l_Pr_RateController.clear();
  Pr_txtTotal_Text = 0;
}

  FncItemtotal(ModSaleDetailsDB l_ModSaleDetailsDB) {
    l_ModSaleDetailsDB = BLSaleDetails().FncItemTotal(l_ModSaleDetailsDB);
    Pr_txtTotal_Text = l_ModSaleDetailsDB.Pr_ItemTotal!;
  }
}
