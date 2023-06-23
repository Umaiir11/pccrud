import 'package:pccrud/MVVM/Model/DB/ModSingleMulti.dart';

import '../../Enum/EnumCrud.dart';
import '../../MVVM/Model/DB/ModSaleDetailsDB.dart';

class QueryGenSingleMulti {
  Future<List<String>> FncGenCrudQueriesSaleDetailsList(List<ModSingleMulti> list_ModSingleMulti) async {
    try {
      List<String> lQueries = [];

      String? Query;
      for (ModSingleMulti l_ModSingleMulti in list_ModSingleMulti) {
        Query =  await FncGenCrudQueriesSaleDetailsModel(l_ModSingleMulti);
        lQueries.add(Query);
      }
      return lQueries;
    } catch (e) {
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }


  Future<String> FncGenCrudQueriesSaleDetailsModel(ModSingleMulti l_ModSingleMulti) async {
    try {

      switch (l_ModSingleMulti.Pr_Operation) {
        case DBOPP.insert:
          return '''
            INSERT INTO TBU_SingleMulti (
              UserName, UserCompany, Rate, Quantity, Operation, PKGUID,ISD
            ) VALUES (
              '${l_ModSingleMulti.Pr_UserName}', '${l_ModSingleMulti.Pr_UserCompany}', '${l_ModSingleMulti.Pr_Rate}',
              '${l_ModSingleMulti.Pr_Quantity}', '${l_ModSingleMulti.Pr_Operation}', '${l_ModSingleMulti.Pr_PKGUID}','false'
            )
          ''';

        case DBOPP.update:
          return '''
            UPDATE TBU_SingleMulti SET
  UserName = '${l_ModSingleMulti.Pr_UserName}',
  UserCompany = '${l_ModSingleMulti.Pr_Quantity}'
WHERE PKGUID = '${l_ModSingleMulti.Pr_PKGUID}'

          ''';

        case DBOPP.delete:
          return '''
            DELETE FROM TBU_SingleMulti
            WHERE Item = '${l_ModSingleMulti.Pr_PKGUID}'
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
