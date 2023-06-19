import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';

import '../Enum/EnumCrud.dart';
import '../MVVM/Model/DB/ModSaleDetailsDB.dart';

class QueryGenSaleDetails {
  Future<List<String>> FncGenCrudQueriesSaleDetails(ModPcSale lModpcsale) async {
    try {
      List<String> lQueries = [];
      for (ModSaleDetails l_ModSaleDetails in lModpcsale.l_PCSaleDetailsDBList) {
        switch (l_ModSaleDetails.Pr_Operation) {
          case DBOPP.insert:
            final query = '''
        INSERT INTO TBU_SalesDetails (
          Item, Quantity, Rate, VmDID, Operation, PKGUID
        ) VALUES (
          '${l_ModSaleDetails.Pr_Item}', '${l_ModSaleDetails.Pr_Quantity}', '${l_ModSaleDetails.Pr_Rate}', 
          '${l_ModSaleDetails.Pr_VmDID}', '${l_ModSaleDetails.Pr_Operation}', '${l_ModSaleDetails.Pr_PKGUID}'
        )
      ''';
            lQueries.add(query);
            break;

          case DBOPP.update:
            final query = '''
        UPDATE TBU_SalesDetails SET
          Item = '${l_ModSaleDetails.Pr_Item}',
          Quantity = '${l_ModSaleDetails.Pr_Quantity}',
          Rate = '${l_ModSaleDetails.Pr_Rate}',
          Operation = '${l_ModSaleDetails.Pr_Operation}'
       WHERE PKGUID = '${l_ModSaleDetails.Pr_VmDID}'
      ''';
            lQueries.add(query);
            break;

          case DBOPP.delete:
            final query = '''
        DELETE FROM TBU_SalesDetails
        WHERE Item = '${l_ModSaleDetails.Pr_Item}'
      ''';
            lQueries.add(query);
            break;
        }
      }
      return lQueries;
    }
     catch (e) {
      // Throw an exception
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }
}
