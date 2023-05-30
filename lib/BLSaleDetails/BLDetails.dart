import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';

import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class BLSaleDetails {


  ModPcSale FncCalculateItemTotalAndGrandTotal(ModPcSale l_ModPcSale) {
    l_ModPcSale.l_PCSaleDetailsDBList.forEach((item) {
      item.Pr_ItemTotal = item.Pr_Quantity! * item.Pr_Rate!;
    });
    l_ModPcSale.Pr_GrandTotal = l_ModPcSale.l_PCSaleDetailsDBList
        .map((item) => item.Pr_ItemTotal)
        .reduce((a, b) => a! + b!);
    return l_ModPcSale;
  }

}
