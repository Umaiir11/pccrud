import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';


class QueryGenDefineCust {
  Future<List<String>> FncGenCrudQueriesDefineCust(ModCustomerDetails lModCustomerDetails) async {
    List<String> lQueries = [];

    final query = '''
    INSERT INTO TBUCustomer (
      CustID, CB, ISD, PKGUID
    ) VALUES (
      '${lModCustomerDetails.Pr_PKGUID}', '${lModCustomerDetails.Pr_CB}', '${lModCustomerDetails.Pr_CustID}', 
      '${lModCustomerDetails.Pr_ISD}'
    )
    ''';
    lQueries.add(query);

    return lQueries;
  }
}
