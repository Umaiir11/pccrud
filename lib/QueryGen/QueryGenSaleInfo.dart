import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';


class QueryGenSaleInfo {
  Future<List<String>> FncGenCrudQueriesSaleInfo(ModPcSale lModpcsale) async {
    List<String> lQueries = [];

    if (lModpcsale.Pr_Operation == 1) {
      final query = '''
    INSERT INTO TBUSalesInfo (
      CustID, Voucher, GrandTotal, Operation, PKGUID
    ) VALUES (
      '${lModpcsale.Pr_CustID}', '${lModpcsale.Pr_Voucher}', '${lModpcsale.Pr_GrandTotal}', 
      '${lModpcsale.Pr_Operation}', '${lModpcsale.Pr_PKGUID}'
    )
    ''';
      lQueries.add(query);
    } else if (lModpcsale.Pr_Operation == 2) {
      final query = '''
    UPDATE TBUSalesInfo SET
      CustID = '${lModpcsale.Pr_CustID}',
      Voucher = '${lModpcsale.Pr_Voucher}',
      GrandTotal = '${lModpcsale.Pr_GrandTotal}',
      Operation = '${lModpcsale.Pr_Operation}'
    WHERE Pr_CustID = '${lModpcsale.Pr_CustID}'
    ''';
      lQueries.add(query);
    } else if (lModpcsale.Pr_Operation == 3) {
      final query = '''
    DELETE FROM TBUSalesInfo
    WHERE Pr_CustID = '${lModpcsale.Pr_CustID}'
    ''';
      lQueries.add(query);
    }

    return lQueries;
  }
}
