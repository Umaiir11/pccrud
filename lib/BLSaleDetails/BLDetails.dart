import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';

import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class BLSaleDetails {


  FncItemTotal(ModSaleDetailsDB l_ModSaleDetailsDB){
    l_ModSaleDetailsDB.Pr_ItemTotal  =  l_ModSaleDetailsDB.Pr_Quantity! * l_ModSaleDetailsDB.Pr_Rate!;
    return l_ModSaleDetailsDB;

  }

  ModPcSale FncCalculateItemTotalAndGrandTotal(ModPcSale l_ModPcSale) {
    l_ModPcSale.l_PCSaleDetailsDBList.forEach((item) {
      item.Pr_ItemTotal = item.Pr_Quantity! * item.Pr_Rate!;

    });

    int grandTotal = 0;
    for (ModSaleDetailsDB item in l_ModPcSale.l_PCSaleDetailsDBList) {
      grandTotal += item.Pr_ItemTotal!;
    }

    l_ModPcSale.Pr_GrandTotal = grandTotal;
    return l_ModPcSale;
  }


}
