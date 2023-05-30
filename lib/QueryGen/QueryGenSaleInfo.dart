import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';

import '../MVVM/Model/DB/ModSaleDB.dart';

class QueryGenSaleInfo {
  Future<List<String>> FncGenCrudQueriesSaleInfo(ModPcSale l_ModPcSale) async {
    List<String> l_Queries = [];

    if (l_ModPcSale.Pr_Operation == 1) {
      final query = '''
    INSERT INTO TBUSalesInfo (
      CustID, Voucher, GrandTotal, Operation, PKGUID
    ) VALUES (
      '${l_ModPcSale.Pr_CustID}', '${l_ModPcSale.Pr_Voucher}', '${l_ModPcSale.Pr_GrandTotal}', 
      '${l_ModPcSale.Pr_Operation}', '${l_ModPcSale.Pr_PKGUID}'
    )
    ''';
      l_Queries.add(query);
    } else if (l_ModPcSale.Pr_Operation == 2) {
      final query = '''
    UPDATE TBUSalesInfo SET
      CustID = '${l_ModPcSale.Pr_CustID}',
      Voucher = '${l_ModPcSale.Pr_Voucher}',
      GrandTotal = '${l_ModPcSale.Pr_GrandTotal}',
      Operation = '${l_ModPcSale.Pr_Operation}'
    WHERE Pr_CustID = '${l_ModPcSale.Pr_CustID}'
    ''';
      l_Queries.add(query);
    } else if (l_ModPcSale.Pr_Operation == 3) {
      final query = '''
    DELETE FROM TBUSalesInfo
    WHERE Pr_CustID = '${l_ModPcSale.Pr_CustID}'
    ''';
      l_Queries.add(query);
    }

    return l_Queries;
  }
}
