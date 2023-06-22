import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDB.dart';
import '../../Enum/EnumCrud.dart';

class QueryGenSaleMain {
  Future<List<String>> FncGenCrudQueriesSaleMainList(List<ModSale> list_ModSale) async {
    try {
      List<String> lQueries = [];
      String? Query;
      for (ModSale l_ModPcSale in list_ModSale) {
         Query =  await FncGenCrudQueriesSaleMainModel(l_ModPcSale);
         lQueries.add(Query);

      }
      return lQueries;
    } catch (e) {
      // Throw an exception
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }

  Future<String> FncGenCrudQueriesSaleMainModel(ModSale l_ModSale) async {
    try {

        switch (l_ModSale.Pr_Operation) {
          case DBOPP.insert:
            return  '''
              INSERT INTO TBU_SalesInfo (
                CustID, Voucher, GrandTotal, Operation, PKGUID
              ) VALUES (
                '${l_ModSale.Pr_CustID}', '${l_ModSale.Pr_Voucher}', '${l_ModSale.Pr_GrandTotal}', 
                '${l_ModSale.Pr_Operation}', '${l_ModSale.Pr_PKGUID}'
              )
            ''';

            break;

          case DBOPP.update:
        return  '''
              UPDATE TBU_SalesInfo SET
                CustID = '${l_ModSale.Pr_CustID}',
                Voucher = '${l_ModSale.Pr_Voucher}',
                GrandTotal = '${l_ModSale.Pr_GrandTotal}',
                Operation = '${l_ModSale.Pr_Operation}'
              WHERE PKGUID = '${l_ModSale.Pr_PKGUID}'
            ''';



          case DBOPP.delete:
            return '''
              DELETE FROM TBU_SalesInfo
              WHERE PKGUID = '${l_ModSale.Pr_PKGUID}'
            ''';

                   }
                return "";
    } catch (e) {
      // Throw an exception
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }
}
