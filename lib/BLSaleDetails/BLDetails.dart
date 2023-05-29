import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class BLSaleDetails{

  int FncCalculateItemTotal(ModSaleDetailsDB l_ModSaleDetailsDB) {
    return l_ModSaleDetailsDB.Pr_Quantity! * l_ModSaleDetailsDB.Pr_Rate!;
  }

  int FncCalculateGrandTotal(List<ModSaleDetailsDB> itemList) {
    int lGrandTotal = 0;
    for (ModSaleDetailsDB item in itemList) {
      //a= a+b
      lGrandTotal += item.Pr_ItemTotal!;
    }
    return lGrandTotal;
  }


}