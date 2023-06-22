import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';
import 'package:pccrud/MVVM/Model/DB/ModSingleMulti.dart';

import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class BLSingleMulti {

  RxList<ModSingleMulti> FncCalculateItemTotalAndGrandTotal2 (RxList<ModSingleMulti> lList) {
    for (var item in lList) {
      item.Pr_Itemtotal = item.Pr_Quantity! * item.Pr_Rate!;
    }

    return lList;
  }

  FncItemTotal(ModSingleMulti lModSingleMulti) {
    lModSingleMulti.Pr_Itemtotal = lModSingleMulti.Pr_Quantity! * lModSingleMulti.Pr_Rate!;
    return lModSingleMulti;
  }
}
