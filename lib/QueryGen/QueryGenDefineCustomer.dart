import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';

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
      // Fetch all data based on PKGUID


      final query = '''
        SELECT * FROM TBUCustomer
      ''';
      lQueries.add(query);
    } else if (lModDefineCustomer.Pr_Operation == 4) {
      // Delete operation based on PKGUID
      final VmDefineCustomer? l_VmDefineCustomer = Get.find<VmDefineCustomer>();
      final String l_WhereClause = "WHERE PKGUID = '${l_VmDefineCustomer?.Pr_txtSelectedPKGUID_Text}'";
      final query = '''
        DELETE FROM TBUCustomer $l_WhereClause
      ''';
      lQueries.add(query);
    }

    return lQueries;
  }
}
