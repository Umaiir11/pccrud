import '../../Enum/EnumCrud.dart';
import '../../MVVM/Model/DB/ModSaleDetailsDB.dart';

class QueryGenSaleDetail {
  Future<List<String>> FncGenCrudQueriesSaleDetailsList(List<ModSaleDetails> list_ModSaleDEtaiks) async {
    try {
      List<String> lQueries = [];

      String? Query;
      for (ModSaleDetails l_ModSaleDetails in list_ModSaleDEtaiks) {
        Query =  await FncGenCrudQueriesSaleDetailsModel(l_ModSaleDetails);
        lQueries.add(Query);
      }
      return lQueries;
    } catch (e) {
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }


  Future<String> FncGenCrudQueriesSaleDetailsModel(ModSaleDetails l_ModSaleDetails) async {
    try {

      switch (l_ModSaleDetails.Pr_Operation) {
            case DBOPP.insert:
              return '''
            INSERT INTO TBU_SalesDetails (
              Item, Quantity, Rate, VmDID, Operation, PKGUID
            ) VALUES (
              '${l_ModSaleDetails.Pr_Item}', '${l_ModSaleDetails.Pr_Quantity}', '${l_ModSaleDetails.Pr_Rate}',
              '${l_ModSaleDetails.Pr_VmDID}', '${l_ModSaleDetails.Pr_Operation}', '${l_ModSaleDetails.Pr_PKGUID}'
            )
          ''';

            case DBOPP.update:
              return '''
            UPDATE TBU_SalesDetails SET
              Item = '${l_ModSaleDetails.Pr_Item}',
              Quantity = '${l_ModSaleDetails.Pr_Quantity}',
              Rate = '${l_ModSaleDetails.Pr_Rate}',
              Operation = '${l_ModSaleDetails.Pr_Operation}'
            WHERE PKGUID = '${l_ModSaleDetails.Pr_VmDID}'
          ''';

            case DBOPP.delete:
              return '''
            DELETE FROM TBU_SalesDetails
            WHERE Item = '${l_ModSaleDetails.Pr_Item}'
          ''';

            default:
            // Handle unrecognized operation
              break;
          }
          return "";
    } catch (e) {
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }

}
