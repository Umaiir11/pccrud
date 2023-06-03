import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDB.dart';
import 'package:pccrud/MVVM/ViewModel/VmSale.dart';
import 'package:uuid/uuid.dart';

import '../../BLSaleDetails/BLDetails.dart';
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

    FncFillDetailsModel();

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

  FncClearDetailModelFields() {
    // Clear the input fields for the next entry
    Pr_txtItem_Text = '';
    Pr_txtQuantity_Text = 0;
    Pr_txtRate_Text = 0;
  }

  FncItemtotal(ModSaleDetailsDB l_ModSaleDetailsDB) {
    l_ModSaleDetailsDB = BLSaleDetails().FncItemTotal(l_ModSaleDetailsDB);
    Pr_txtTotal_Text = l_ModSaleDetailsDB.Pr_ItemTotal!;
  }
}
