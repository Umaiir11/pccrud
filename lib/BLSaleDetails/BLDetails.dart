import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class BLSaleDetails {
  FncItemTotal(ModSaleDetailsDB lModsaledetailsdb) {
    lModsaledetailsdb.Pr_ItemTotal = lModsaledetailsdb.Pr_Quantity! * lModsaledetailsdb.Pr_Rate!;
    return lModsaledetailsdb;
  }
}
