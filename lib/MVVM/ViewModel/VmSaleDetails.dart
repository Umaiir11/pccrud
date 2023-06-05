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

  // Retrieve the ModSaleDB object from the existing instance of VmSale

  FncFill_SaleDetailsModel() {
    ModSaleDetails l_ModSaledetails = ModSaleDetails(); // Create a new instance

    //Get the filled Sale model instace
    ModSale? lModSale = l_VmSale?.FncFill_SaleModel();

    String lUuid = const Uuid().v4();
    l_ModSaledetails.Pr_PKGUID = lUuid;
    l_ModSaledetails.Pr_Operation = 1;
    l_ModSaledetails.Pr_VmDID = lModSale?.Pr_PKGUID;
    l_ModSaledetails.Pr_Item = Pr_txtItem_Text;
    l_ModSaledetails.Pr_Quantity = Pr_txtQuantity_Text;
    l_ModSaledetails.Pr_Rate = Pr_txtRate_Text;
    FncItemtotal(l_ModSaledetails);

    return l_ModSaledetails; // Return the instance
  }

  //this method is  responsible for claculation in dialog box
  FncSet_SalesDetailsModelData(ModSaleDetails l_FilledSaleDetailsModel) {
    ModSaleDetails l_ModSaleDetails = ModSaleDetails(); // Create a new instance

    if (l_FilledSaleDetailsModel.Pr_Item != null) {
      l_ModSaleDetails.Pr_Item = l_FilledSaleDetailsModel.Pr_Item;
    }
    if (l_FilledSaleDetailsModel.Pr_Quantity != null) {
      l_ModSaleDetails.Pr_Quantity = l_FilledSaleDetailsModel.Pr_Quantity;
    }
    if (l_FilledSaleDetailsModel.Pr_Rate != null) {
      l_ModSaleDetails.Pr_Rate = l_FilledSaleDetailsModel.Pr_Rate;
    }

    FncItemtotal(l_ModSaleDetails);
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
