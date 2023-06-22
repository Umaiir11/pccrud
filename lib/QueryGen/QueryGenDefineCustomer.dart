import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';

import '../Enum/EnumCrud.dart';


class QueryGenDefineCust {
  Future<List<String>> FncGenCrudQueriesDefineCustList(List<ModDefineCustomer> l_ListModDefineCustomer) async {
    try {
      List<String> lQueries = [];
      String? Query;
      for (ModDefineCustomer l_ModDefineCustomer in l_ListModDefineCustomer) {
        Query =  await FncGenCrudQueriesDefineCustModel(l_ModDefineCustomer);
        lQueries.add(Query);
      }
      return lQueries;
    } catch (e) {
      // Throw an exception
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }

  Future <String> FncGenCrudQueriesDefineCustModel(ModDefineCustomer lModDefineCustomer) async {
    try {
      switch (lModDefineCustomer.Pr_Operation) {
        case DBOPP.insert:
        // Insert operation
          return '''
          INSERT INTO TBU_Customer (
            PKGUID, CustID, CB, ISD, Operation
          ) VALUES (
            '${lModDefineCustomer.Pr_PKGUID}', '${lModDefineCustomer.Pr_CustID}', '${lModDefineCustomer.Pr_CB}', 
            'false','${lModDefineCustomer.Pr_Operation}'
          )
        ''';

        case DBOPP.update:
          return ''' UPDATE TBU_Customer
          SET
            CustID = '${lModDefineCustomer.Pr_CustID}',
            CB = '${lModDefineCustomer.Pr_CB}',
            ISD = 'false'
          WHERE PKGUID = '${lModDefineCustomer.Pr_PKGUID}'
        ''';
        case DBOPP.delete:
        // Delete operation based on PKGUID
          final String lWhereclause = "WHERE PKGUID = '${lModDefineCustomer.Pr_PKGUID}'";
          return '''
          UPDATE TBU_Customer
          SET ISD = 'true' $lWhereclause
        ''';
      }

      return "";
    } catch (e) {
      // Throw an exception
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }
}
