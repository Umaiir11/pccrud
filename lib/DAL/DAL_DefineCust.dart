import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';
import 'package:pccrud/QueryGen/QueryGenDefineCustomer.dart';
import 'package:sqflite/sqflite.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

class DAL_DefineCust extends GetxController {
  RxList<ModDefineCustomer> l_DefineCustomerListDB1 = <ModDefineCustomer>[].obs;

  Future<void> Fnc_Cud(ModDefineCustomer lModCustomerDetails) async {
    Database? lDatabase = await DBHelper().FncGetDatabaseIns();
    List<String> l_Query = await QueryGenDefineCust().FncGenCrudQueriesDefineCust(lModCustomerDetails);

    final batch = lDatabase!.batch();

    for (String query in l_Query) {
      if (query.startsWith('SELECT')) {
        await FncFetchData(query); // Execute separate method for fetching and storing data
      } else {
        batch.execute(query);
      }
    }
    await batch.commit();
  }

  Future<void> FncFetchData(String query) async {
    Database? lDatabase = await DBHelper().FncGetDatabaseIns();
    List<Map<String, dynamic>> results = await lDatabase!.rawQuery(query);

    List<ModDefineCustomer> l_DefineCustomerListDB = results.map((row) {
      return ModDefineCustomer(
        Pr_PKGUID: row['PKGUID'],
        Pr_CustID: row['CustID'],
        Pr_CB: row['CB'],
        Pr_ISD: row['ISD'],
        Pr_Operation: row['Operation'],
      );
    }).toList();
    l_DefineCustomerListDB1.addAll(l_DefineCustomerListDB);

    // Do something with the fetched data
    // ...
  }
}
