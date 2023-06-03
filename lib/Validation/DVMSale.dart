import 'package:pccrud/MVVM/Model/DB/ModSaleDB.dart';
import 'package:tuple/tuple.dart';

class DVMSale {
  static Tuple2<List<String>?, List<String>?> Fnc_Validate(ModSaleDB lModsaledb) {
    List<String>? lErrorMsgs = [];
    List<String>? lFieldNames = [];

    if (lModsaledb.Pr_CustID?.isEmpty ?? true) {
      lErrorMsgs.add('Enter your customer ID.');
      lFieldNames.add('Pr_CustID');
    }

    if (lModsaledb.Pr_GrandTotal == null || lModsaledb.Pr_GrandTotal == 0) {
      lErrorMsgs.add('Enter your Rate.');
      lFieldNames.add('Pr_GrandTotal');
    }



    if (lModsaledb.Pr_Voucher?.isEmpty ?? true) {
      lErrorMsgs.add('Enter your voucher.');
      lFieldNames.add('Pr_Voucher');
    }

    // Add more field validation here as needed

    if (lErrorMsgs.isNotEmpty || lFieldNames.isNotEmpty) {
      return Tuple2(lErrorMsgs, lFieldNames);
    }

    return const Tuple2(null, null);
  }
}
