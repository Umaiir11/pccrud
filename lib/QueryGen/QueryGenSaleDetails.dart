import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';

import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class QueryGenSaleDetails {
  Future<List<String>> FncGenCrudQueriesSaleDetails(ModPcSale lModpcsale) async {
    List<String> lQueries = [];

    for (ModSaleDetails l_ModUserDB in lModpcsale.l_PCSaleDetailsDBList) {
      if (l_ModUserDB.Pr_Operation == 1) {
        final query = '''
        INSERT INTO TBUSalesDetails (
          Item, Quantity, Rate, VmDID, Operation, PKGUID
        ) VALUES (
          '${l_ModUserDB.Pr_Item}', '${l_ModUserDB.Pr_Quantity}', '${l_ModUserDB.Pr_Rate}', 
          '${l_ModUserDB.Pr_VmDID}', '${l_ModUserDB.Pr_Operation}', '${l_ModUserDB.Pr_PKGUID}'
        )
      ''';
        lQueries.add(query);
      } else if (l_ModUserDB.Pr_Operation == 2) {
        final query = '''
        UPDATE TBUSalesDetails SET
          Item = '${l_ModUserDB.Pr_Item}',
          Quantity = '${l_ModUserDB.Pr_Quantity}',
          Rate = '${l_ModUserDB.Pr_Rate}',
          Operation = '${l_ModUserDB.Pr_Operation}'
        WHERE Item = '${l_ModUserDB.Pr_Item}'
      ''';
        lQueries.add(query); // Add the query to the list
      } else if (l_ModUserDB.Pr_Operation == 3) {
        final query = '''
        DELETE FROM TBUSalesDetails
        WHERE Item = '${l_ModUserDB.Pr_Item}'
      ''';
        lQueries.add(query);
      }
    }

    return lQueries;
  }
}
