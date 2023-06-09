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
      if (query.trim().toUpperCase().startsWith('SELECT')) {
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

    for (Map<String, dynamic> row in results) {
      ModDefineCustomer defineCustomer = ModDefineCustomer(
        Pr_PKGUID: row['PKGUID'],
        Pr_CustID: row['CustID'],
        Pr_CB: row['CB'],
        Pr_ISD: row['ISD'],
        Pr_Operation: row['Operation'],
      );
      l_DefineCustomerListDB1.add(defineCustomer);

      // Do something with the fetched data for each row
      // ...
    }

      print(l_DefineCustomerListDB1);
      print(l_DefineCustomerListDB1);
  }}
