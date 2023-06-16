import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';

class QueryGenDefineCust {
  Future<List<String>> FncGenCrudQueriesDefineCust(ModDefineCustomer lModDefineCustomer) async {
    List<String> lQueries = [];

    if (lModDefineCustomer.Pr_Operation == 1) {
      // Insert operation
      final query = '''
        INSERT INTO TBUCustomer (
          PKGUID, CustID, CB, ISD, Operation
        ) VALUES (
          '${lModDefineCustomer.Pr_PKGUID}', '${lModDefineCustomer.Pr_CustID}', '${lModDefineCustomer.Pr_CB}', 
          '${lModDefineCustomer.Pr_ISD}','${lModDefineCustomer.Pr_Operation}'
        )
      ''';
      lQueries.add(query);
    } else if (lModDefineCustomer.Pr_Operation == 2) {
      // Fetch all operation
      final query = '''
        SELECT * FROM TBUCustomerView WHERE ISD = 'true';
      ''';
      lQueries.add(query);
    } else if (lModDefineCustomer.Pr_Operation == 3) {
      // Fetch all data based on PKGUID
      final query = '''
        SELECT * FROM TBUCustomerView
      ''';
      lQueries.add(query);
    } else if (lModDefineCustomer.Pr_Operation == 2) {
      // Delete operation based on PKGUID
      final VmDefineCustomer? l_VmDefineCustomer = Get.find<VmDefineCustomer>();
      final String l_WhereClause = "WHERE PKGUID = '${lModDefineCustomer?.Pr_PKGUID}'";
      final query = '''
        UPDATE TBUCustomer
        SET ISD = 'false' $l_WhereClause
      ''';
      lQueries.add(query);
    } else if (lModDefineCustomer.Pr_Operation == 5) {
      // Update operation based on PKGUID
      //final VmDefineCustomer? l_VmDefineCustomer = Get.find<VmDefineCustomer>();
      final query = '''
  UPDATE TBUCustomer
  SET
    CustID = '${lModDefineCustomer.Pr_CustID}',
    CB = '${lModDefineCustomer.Pr_CB}'
  WHERE PKGUID = '${lModDefineCustomer?.Pr_PKGUID}'
''';

      lQueries.add(query);
    }

    return lQueries;
  }
}
