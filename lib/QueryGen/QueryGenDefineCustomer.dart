import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';

class QueryGenDefineCust {
  Future<List<String>> FncGenCrudQueriesDefineCust(ModDefineCustomer lModDefineCustomer) async {
    List<String> lQueries = [];

    if (lModDefineCustomer.Pr_Operation == 1) {
      final query = '''
        INSERT INTO TBUCustomer (
          PKGUID, CustID, CB, ISD, Operation
        ) VALUES (
          '${lModDefineCustomer.Pr_PKGUID}', '${lModDefineCustomer.Pr_CB}', '${lModDefineCustomer.Pr_CustID}', 
          '${lModDefineCustomer.Pr_ISD}','${lModDefineCustomer.Pr_Operation}'
        )
      ''';
      lQueries.add(query);
    } else if (lModDefineCustomer.Pr_Operation == 2) {
      // Fetch all operation
      final query = '''
        SELECT * FROM TBUCustomer
      ''';
      lQueries.add(query);
    } else if (lModDefineCustomer.Pr_Operation == 3) {
      // Add your logic for operation 3 here
    }

    return lQueries;
  }
}
