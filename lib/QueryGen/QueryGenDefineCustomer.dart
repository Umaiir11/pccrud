import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';


class QueryGenDefineCust {
  Future<List<String>> FncGenCrudQueriesDefineCust(ModCustomerDetails lModCustomerDetails) async {
    List<String> lQueries = [];


    if (lModCustomerDetails.Pr_Operation == 1) {
      final query = '''
    INSERT INTO TBUCustomer (
      PKGUID, CustID, CB, ISD, Operation
    ) VALUES (
      '${lModCustomerDetails.Pr_PKGUID}', '${lModCustomerDetails.Pr_CB}', '${lModCustomerDetails.Pr_CustID}', 
      '${lModCustomerDetails.Pr_ISD}','${lModCustomerDetails.Pr_Operation}'
    )
    ''';
      lQueries.add(query);
    }

    else if(lModCustomerDetails.Pr_Operation==2){

    }
    else if (lModCustomerDetails.Pr_Operation == 3) {}

    return lQueries;
  }
}
