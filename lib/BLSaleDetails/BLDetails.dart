import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';

import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class BLSaleDetails {
  int FncCalculateItemTotal(ModPcSale l_ModPcSale, int indexofList) {
    return l_ModPcSale.l_PCSaleDetailsDBList[indexofList].Pr_Quantity! *
        l_ModPcSale.l_PCSaleDetailsDBList[indexofList].Pr_Rate!;
  }

  int FncCalculateGrandTotal(ModPcSale l_ModPcSale) {
    int lGrandTotal = 0;
    for (ModSaleDetailsDB item in l_ModPcSale.l_PCSaleDetailsDBList) {
      //a= a+b
      lGrandTotal += item.Pr_ItemTotal!;
    }
    return lGrandTotal;
  }
}
