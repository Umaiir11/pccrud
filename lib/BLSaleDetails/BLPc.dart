import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';

import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class BLPc {
  ModPcSale FncCalculateItemTotalAndGrandTotal(ModPcSale lModpcsale) {
    for (var item in lModpcsale.l_PCSaleDetailsDBList) {
      item.Pr_ItemTotal = item.Pr_Quantity! * item.Pr_Rate!;
    }

    int grandTotal = 0;
    for (ModSaleDetails item in lModpcsale.l_PCSaleDetailsDBList) {
      grandTotal += item.Pr_ItemTotal!;
    }

    lModpcsale.Pr_GrandTotal = grandTotal;
    return lModpcsale;
  }


  RxList<ModSaleDetails> FncCalculateItemTotalAndGrandTotal2 (RxList<ModSaleDetails> l_List) {
    for (var item in l_List) {
      item.Pr_ItemTotal = item.Pr_Quantity! * item.Pr_Rate!;
    }

    return l_List;
  }
}
