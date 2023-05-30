import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';
import 'package:uuid/uuid.dart';

import '../../BLSaleDetails/BLDetails.dart';
import '../Model/DB/ModSaleDB.dart';
import '../Model/DB/ModSaleDetailsDB.dart';

class VmSale extends GetxController {
  RxBool l_TextFieldsValidation = false.obs;

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

  RxInt l_PrOperation = RxInt(0);

  int get Pr_txtOperation_Text {
    return l_PrOperation.value;
  }

  set Pr_txtOperation_Text(int value) {
    l_PrOperation.value = value;
  }


  ModSaleDB l_ModSaleDB = ModSaleDB();
  FncFillModel() {

    ModPcSale l_ModSalePc = ModPcSale();
    String l_Uuid = const Uuid().v4();
    l_ModSaleDB.Pr_PKGUID = l_Uuid;
    l_ModSaleDB.Pr_Operation = Pr_txtOperation_Text;
    l_ModSaleDB.Pr_CustID = Pr_txtCustID_Text;
    l_ModSaleDB.Pr_Voucher = Pr_txtVoucher_Text;
    l_ModSaleDB.Pr_GrandTotal = Pr_txtGrandTotal_Text;
    print(l_ModSaleDB);
    print(l_ModSaleDB);

    l_ModSalePc.Pr_PKGUID = l_ModSaleDB.Pr_PKGUID;
    l_ModSalePc.Pr_Operation = l_ModSaleDB.Pr_Operation;
    l_ModSalePc.Pr_CustID = l_ModSaleDB.Pr_CustID;
    l_ModSalePc.Pr_Voucher = l_ModSaleDB.Pr_Voucher;
    l_ModSalePc.Pr_GrandTotal = l_ModSaleDB.Pr_GrandTotal;

    print(l_ModSalePc);
    print(l_ModSalePc);
  }

//==============================SaleDetails=========================================================

  //TextfieldsProp
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

  RxInt l_PrOperation2 = RxInt(0);

  int get Pr_txtOperation2_Text {
    return l_PrOperation.value;
  }

  set Pr_txtOperation2_Text(int value) {
    l_PrOperation.value = value;
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

  RxList<ModSaleDetailsDB> l_ModSaleDetailsDBList = <ModSaleDetailsDB>[].obs;
  ModPcSale l_ModPcSale = ModPcSale();
  FncFillModelList() {
    String l_Uuid = const Uuid().v4();

    ModSaleDetailsDB l_ModSaleDetailsDB = ModSaleDetailsDB();

    l_ModSaleDetailsDB.Pr_PKGUID = l_Uuid;
    l_ModSaleDetailsDB.Pr_Operation = l_ModSaleDB.Pr_Operation;
    l_ModSaleDetailsDB.Pr_VmDID = l_ModSaleDB.Pr_PKGUID;
    l_ModSaleDetailsDB.Pr_Item = Pr_txtItem_Text;
    l_ModSaleDetailsDB.Pr_Quantity = Pr_txtQuantity_Text;
    l_ModSaleDetailsDB.Pr_Rate = Pr_txtRate_Text;
    print(l_ModSaleDetailsDB);
    l_ModSaleDetailsDBList.add(l_ModSaleDetailsDB);
    l_ModPcSale.l_PCSaleDetailsDBList.add(l_ModSaleDetailsDB);
    print(l_ModPcSale.l_PCSaleDetailsDBList);

      l_ModPcSale = BLSaleDetails().FncCalculateItemTotalAndGrandTotal(l_ModPcSale);
      l_ModPcSale.l_PCSaleDetailsDBList.forEach((item) {
      Pr_txtTotal_Text= item.Pr_ItemTotal!;
    });
      Pr_txtGrandTotal_Text = l_ModPcSale.Pr_GrandTotal!;

  }
  FncClearDetailModelFields() {
    // Clear the input fields for the next entry
    Pr_txtItem_Text = '';
    Pr_txtQuantity_Text = 0;
    Pr_txtRate_Text = 0;
  }
}
