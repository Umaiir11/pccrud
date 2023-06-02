import 'package:get/get.dart';
import 'package:pccrud/BLSaleDetails/BLPc.dart';
import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';
import 'package:pccrud/MVVM/ViewModel/VmSaleDetails.dart';
import 'package:uuid/uuid.dart';

import '../Model/DB/ModSaleDB.dart';
import '../Model/DB/ModSaleDetailsDB.dart';

class VmSale extends GetxController {
  RxBool l_TextFieldsValidation = false.obs;
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

  RxInt l_PrOperation = RxInt(0);

  int get Pr_txtOperation_Text {
    return l_PrOperation.value;
  }

  set Pr_txtOperation_Text(int value) {
    l_PrOperation.value = value;
  }


  ModSaleDB l_ModSaleDB = ModSaleDB();
  FncFillModel() {
     l_Uuid = const Uuid().v4();

    l_ModSaleDB.Pr_PKGUID = l_Uuid;
    l_ModSaleDB.Pr_Operation = Pr_txtOperation_Text;
    l_ModSaleDB.Pr_CustID = Pr_txtCustID_Text;
    l_ModSaleDB.Pr_Voucher = Pr_txtVoucher_Text;
    l_ModSaleDB.Pr_GrandTotal = Pr_txtGrandTotal_Text;
    print(l_ModSaleDB);
    print(l_ModSaleDB);


  }

//=======================================================================================

  ModPcSale l_ModPcSale = ModPcSale();

  FncFillPCModelList() {

    VmSaleDetails? l_VmSaleDetails = Get.find<VmSaleDetails>();
    l_ModPcSale.Pr_PKGUID = l_ModSaleDB.Pr_PKGUID;
    l_ModPcSale.Pr_Operation = l_ModSaleDB.Pr_Operation;
    l_ModPcSale.Pr_CustID = l_ModSaleDB.Pr_CustID;
    l_ModPcSale.Pr_Voucher = l_ModSaleDB.Pr_Voucher;
    l_ModPcSale.Pr_GrandTotal = l_ModSaleDB.Pr_GrandTotal;
    ModSaleDetailsDB? l_ModSaleDetailsDB = l_VmSaleDetails?.l_ModSaleDetailsDB;
    l_ModPcSale.l_PCSaleDetailsDBList.add(l_ModSaleDetailsDB!);
    print(l_ModPcSale.l_PCSaleDetailsDBList);

    FncCalculateItemTotal();

  }

  FncCalculateItemTotal(){
    l_ModPcSale = BLPc().FncCalculateItemTotalAndGrandTotal(l_ModPcSale);
    l_ModPcSale.l_PCSaleDetailsDBList.forEach((item) {
    });
    Pr_txtGrandTotal_Text = l_ModPcSale.Pr_GrandTotal!;
    print("Done");

  }


}
