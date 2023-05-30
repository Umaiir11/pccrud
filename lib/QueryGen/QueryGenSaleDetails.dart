import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';

import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class QueryGenSaleDetails {
  Future<List<String>> FncGenCrudQueriesSaleDetails(ModPcSale l_ModPcSale) async {
    List<String> l_Queries = [];

    for (ModSaleDetailsDB l_ModUserDB in l_ModPcSale.l_PCSaleDetailsDBList) {
      if (l_ModUserDB.Pr_Operation == 1) {
        final query = '''
        INSERT INTO TBUSalesDetails (
          Item, Quantity, Rate, VmDID, Operation, PKGUID
        ) VALUES (
          '${l_ModUserDB.Pr_Item}', '${l_ModUserDB.Pr_Quantity}', '${l_ModUserDB.Pr_Rate}', 
          '${l_ModUserDB.Pr_VmDID}', '${l_ModUserDB.Pr_Operation}', '${l_ModUserDB.Pr_PKGUID}'
        )
      ''';
        l_Queries.add(query);
      } else if (l_ModUserDB.Pr_Operation == 2) {
        final query = '''
        UPDATE TBUSalesDetails SET
          Item = '${l_ModUserDB.Pr_Item}',
          Quantity = '${l_ModUserDB.Pr_Quantity}',
          Rate = '${l_ModUserDB.Pr_Rate}',
          Operation = '${l_ModUserDB.Pr_Operation}'
        WHERE Item = '${l_ModUserDB.Pr_Item}'
      ''';
        l_Queries.add(query); // Add the query to the list
      } else if (l_ModUserDB.Pr_Operation == 3) {
        final query = '''
        DELETE FROM TBUSalesDetails
        WHERE Item = '${l_ModUserDB.Pr_Item}'
      ''';
        l_Queries.add(query);
      }
    }

    return l_Queries;
  }
}
