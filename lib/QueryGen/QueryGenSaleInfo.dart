import '../MVVM/Model/DB/ModSaleDB.dart';

class QueryGenSaleInfo {
  Future<List<String>> FncGenCrudQueriesSaleInfo(ModSaleDB l_ModSaleDB) async {
    List<String> l_Queries = [];

    if (l_ModSaleDB.Pr_Operation == 1) {
      final query = '''
    INSERT INTO TBUSalesInfo (
      CustID, Voucher, GrandTotal, Operation, PKGUID
    ) VALUES (
      '${l_ModSaleDB.Pr_CustID}', '${l_ModSaleDB.Pr_Voucher}', '${l_ModSaleDB.Pr_GrandTotal}', 
      '${l_ModSaleDB.Pr_Operation}', '${l_ModSaleDB.Pr_PKGUID}'
    )
    ''';
      l_Queries.add(query);
    } else if (l_ModSaleDB.Pr_Operation == 2) {
      final query = '''
    UPDATE TBUSalesInfo SET
      CustID = '${l_ModSaleDB.Pr_CustID}',
      Voucher = '${l_ModSaleDB.Pr_Voucher}',
      GrandTotal = '${l_ModSaleDB.Pr_GrandTotal}',
      Operation = '${l_ModSaleDB.Pr_Operation}'
    WHERE Pr_CustID = '${l_ModSaleDB.Pr_CustID}'
    ''';
      l_Queries.add(query);
    } else if (l_ModSaleDB.Pr_Operation == 3) {
      final query = '''
    DELETE FROM TBUSalesInfo
    WHERE Pr_CustID = '${l_ModSaleDB.Pr_CustID}'
    ''';
      l_Queries.add(query);
    }

    return l_Queries;
  }
}
