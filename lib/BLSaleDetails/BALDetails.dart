import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class BLSaleDetails{

  int FncCalculateItemTotalAtIndex( ModSaleDetailsDB itemList) {
    ModSaleDetailsDB item = itemList;
    return item.Pr_Quantity! * item.Pr_Rate!;
  }
}