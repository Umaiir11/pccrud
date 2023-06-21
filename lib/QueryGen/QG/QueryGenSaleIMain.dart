import '../../Enum/EnumCrud.dart';
import '../../MVVM/Model/DB/ModSaleDB.dart';

class QueryGenSaleMain {
  Future<List<String>> FncGenCrudQueriesSaleInfo(List<ModSale> list_lModSale) async {
    try {
      List<String> lQueries = [];
      for (ModSale l_ModSale in list_lModSale) {
        switch (l_ModSale.Pr_Operation) {
          case DBOPP.insert:
            final query = '''
              INSERT INTO TBU_SalesInfo (
                CustID, Voucher, GrandTotal, Operation, PKGUID
              ) VALUES (
                '${l_ModSale.Pr_CustID}', '${l_ModSale.Pr_Voucher}', '${l_ModSale.Pr_GrandTotal}', 
                '${l_ModSale.Pr_Operation}', '${l_ModSale.Pr_PKGUID}'
              )
            ''';
            lQueries.add(query);
            break;

          case DBOPP.update:
            final query = '''
              UPDATE TBU_SalesInfo SET
                CustID = '${l_ModSale.Pr_CustID}',
                Voucher = '${l_ModSale.Pr_Voucher}',
                GrandTotal = '${l_ModSale.Pr_GrandTotal}',
                Operation = '${l_ModSale.Pr_Operation}'
              WHERE PKGUID = '${l_ModSale.Pr_PKGUID}'
            ''';
            lQueries.add(query);
            break;

          case DBOPP.delete:
            final query = '''
              DELETE FROM TBU_SalesInfo
              WHERE PKGUID = '${l_ModSale.Pr_PKGUID}'
            ''';
            lQueries.add(query);
            break;
        }
      }

      return lQueries;
    } catch (e) {
      // Throw an exception
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }
}
