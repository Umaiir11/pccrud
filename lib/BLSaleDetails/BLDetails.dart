import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class BLSaleDetails {
  FncItemTotal(ModSaleDetails lModsaledetailsdb) {
    lModsaledetailsdb.Pr_ItemTotal = lModsaledetailsdb.Pr_Quantity! * lModsaledetailsdb.Pr_Rate!;
    return lModsaledetailsdb;
  }
}
