import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';

import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class BLSaleDetails {


  FncItemTotal(ModSaleDetailsDB l_ModSaleDetailsDB){
    l_ModSaleDetailsDB.Pr_ItemTotal  =  l_ModSaleDetailsDB.Pr_Quantity! * l_ModSaleDetailsDB.Pr_Rate!;
    return l_ModSaleDetailsDB;

  }


}
