import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';

import '../Enum/EnumCrud.dart';


class QueryGenDefineCust {
  Future<List<String>> FncGenCrudQueriesDefineCust(ModDefineCustomer lModDefineCustomer) async {
    List<String> lQueries = [];

    switch (lModDefineCustomer.Pr_Operation) {
      case DBOPP.insert:
      // Insert operation
        final query = '''
        INSERT INTO TBU_Customer (
          PKGUID, CustID, CB, ISD, Operation
        ) VALUES (
          '${lModDefineCustomer.Pr_PKGUID}', '${lModDefineCustomer.Pr_CustID}', '${lModDefineCustomer.Pr_CB}', 
          'false','${lModDefineCustomer.Pr_Operation}'
        )
      ''';
        lQueries.add(query);
        break;

      case DBOPP.update:
        final query = ''' UPDATE TBU_Customer
        SET
       CustID = '${lModDefineCustomer.Pr_CustID}',
        CB = '${lModDefineCustomer.Pr_CB}',
         ISD = 'false'
        WHERE PKGUID = '${lModDefineCustomer.Pr_PKGUID}'
                      ''';
        lQueries.add(query);
        break;

      case DBOPP.delete:
      // Delete operation based on PKGUID
        final String lWhereclause = "WHERE PKGUID = '${lModDefineCustomer.Pr_PKGUID}'";
        final query = '''
        UPDATE TBU_Customer
        SET ISD = 'true' $lWhereclause
      ''';
        lQueries.add(query);
        break;
    }

    return lQueries;
  }
}
