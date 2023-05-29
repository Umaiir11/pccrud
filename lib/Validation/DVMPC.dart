import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDB.dart';
import 'package:tuple/tuple.dart';

class DVMSalePC {
  static Tuple2<List<String>?, List<String>?> Fnc_Validate(ModPcSale l_ModPcSale) {
    List<String>? lErrorMsgs = [];
    List<String>? lFieldNames = [];

    if (l_ModPcSale.Pr_CustID?.isEmpty ?? true) {
      lErrorMsgs.add('Enter your customer ID.');
      lFieldNames.add('Pr_CustID');
    }

    if (l_ModPcSale.Pr_GrandTotal == null || l_ModPcSale.Pr_GrandTotal == 0) {
      lErrorMsgs.add('Enter your Rate.');
      lFieldNames.add('Pr_GrandTotal');
    }



    if (l_ModPcSale.Pr_Voucher?.isEmpty ?? true) {
      lErrorMsgs.add('Enter your voucher.');
      lFieldNames.add('Pr_Voucher');
    }


    if (l_ModPcSale.l_ModSaleDetailsDBListt[0].Pr_Item?.isEmpty ?? true) {
      lErrorMsgs.add('Enter your item.');
      lFieldNames.add('Pr_Item');
    }

    if (l_ModPcSale.l_ModSaleDetailsDBListt[0].Pr_Quantity == null || l_ModPcSale.l_ModSaleDetailsDBListt[0].Pr_Quantity == 0) {
      lErrorMsgs.add('Enter your Quantity.');
      lFieldNames.add('Pr_Quantity');
    }

    if (l_ModPcSale.l_ModSaleDetailsDBListt[0].Pr_Rate == null || l_ModPcSale.l_ModSaleDetailsDBListt[0].Pr_Rate == 0) {
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
