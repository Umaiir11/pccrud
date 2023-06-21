import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';

import '../Enum/EnumCrud.dart';


class QueryGenSaleInfo {
  Future<List<String>> FncGenCrudQueriesSaleInfo(ModPcSale lModpcsale) async {

    try {
      List<String> lQueries = [];
      switch (lModpcsale.Pr_Operation) {
        case DBOPP.insert:
          final query = '''
    INSERT INTO TBU_SalesInfo (
      CustID, Voucher, GrandTotal, Operation, PKGUID
    ) VALUES (
      '${lModpcsale.Pr_CustID}', '${lModpcsale.Pr_Voucher}', '${lModpcsale.Pr_GrandTotal}', 
      '${lModpcsale.Pr_Operation}', '${lModpcsale.Pr_PKGUID}'
    )
    ''';
          lQueries.add(query);
          break;

        case DBOPP.update:
          final query = '''
    UPDATE TBU_SalesInfo SET
      CustID = '${lModpcsale.Pr_CustID}',
      Voucher = '${lModpcsale.Pr_Voucher}',
      GrandTotal = '${lModpcsale.Pr_GrandTotal}',
      Operation = '${lModpcsale.Pr_Operation}'
     WHERE PKGUID = '${lModpcsale.Pr_PKGUID}'
    ''';
          lQueries.add(query);
          break;

        case DBOPP.delete:
          final query = '''
    DELETE FROM TBU_SalesInfo
    WHERE PKGUID = '${lModpcsale.Pr_PKGUID}'
    ''';
          lQueries.add(query);
          break;
      }




      return lQueries;
    }

      catch (e) {
      // Throw an exception
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }
}
