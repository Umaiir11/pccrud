import 'package:pccrud/MVVM/Model/DB/ModSaleDetailsDB.dart';
import 'package:tuple/tuple.dart';

class DVMSaleDetails {
  static Tuple2<List<String>?, List<String>?> Fnc_Validate(ModSaleDetailsDB l_ModSaleDetailsDB) {
    List<String>? lErrorMsgs = [];
    List<String>? lFieldNames = [];

    if (l_ModSaleDetailsDB.Pr_Item?.isEmpty ?? true) {
      lErrorMsgs.add('Enter your item.');
      lFieldNames.add('Pr_Item');
    }

    if (l_ModSaleDetailsDB.Pr_Quantity == null || l_ModSaleDetailsDB.Pr_Quantity == 0) {
      lErrorMsgs.add('Enter your Quantity.');
      lFieldNames.add('Pr_Quantity');
    }

    if (l_ModSaleDetailsDB.Pr_Rate == null || l_ModSaleDetailsDB.Pr_Rate == 0) {
      lErrorMsgs.add('Enter your Rate.');
      lFieldNames.add('Pr_Rate');
    }

    // Add more field validation here as needed

    if (lErrorMsgs.isNotEmpty || lFieldNames.isNotEmpty) {
      return Tuple2(lErrorMsgs, lFieldNames);
    }

    return const Tuple2(null, null);
  }
}
