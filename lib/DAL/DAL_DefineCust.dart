import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';
import 'package:pccrud/QueryGen/QueryGenDefineCustomer.dart';
import 'package:sqflite/sqflite.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

class DAL_DefineCust extends GetxController {

  Future<bool> Fnc_Cud(ModDefineCustomer lModCustomerDetails) async {
    try {
      Database? lDatabase = await DBHelper().FncGetDatabaseIns();
      List<String> l_Query = await QueryGenDefineCust().FncGenCrudQueriesDefineCust(lModCustomerDetails);

      final batch = lDatabase!.batch();

      for (String query in l_Query) {
        batch.execute(query);
      }

      await batch.commit();
      return true;
    } catch (e) {
      print("Error executing queries: $e");
      return false;
    }
  }


  Future<bool> Fnc_Read(ModDefineCustomer lModCustomerDetails, String l_WhereClause) async {
    try {
      List<String> l_Query = await QueryGenDefineCust().FncGenCrudQueriesDefineCust(lModCustomerDetails);
      for (String query in l_Query) {
        if (query.trim().toUpperCase().startsWith('SELECT')) {
          String finalQuery= query+l_WhereClause;
          if (finalQuery.toUpperCase().contains('PKGUID')) {
            await FncFillModel(finalQuery);
          } else {
            await FncFetchData(query);
          }
        }
      }

      return true;
    } catch (e) {
      print("Error reading data: $e");
      return false;
    }
  }

  Future<void> FncFetchData(String query) async {
    Database? lDatabase = await DBHelper().FncGetDatabaseIns();
    List<Map<String, dynamic>> l_FetchedDATA = await lDatabase!.rawQuery(query);

    VmDefineCustomer? lVmDefineCustomer = Get.find<VmDefineCustomer>();



    for (Map<String, dynamic> row in l_FetchedDATA) {
      ModDefineCustomer l_ModDefineCustomer = ModDefineCustomer(
        Pr_PKGUID: row['PKGUID'],
        Pr_CustID: row['CustID'],
        Pr_CB: row['CB'],
        Pr_ISD: row['ISD'],
        Pr_Operation: row['Operation'],
      );

    }
  }

  Future<void> FncFillModel(String query) async {
    Database? lDatabase = await DBHelper().FncGetDatabaseIns();
    List<Map<String, dynamic>> l_FetchedDATA = await lDatabase!.rawQuery(query);

    if (l_FetchedDATA.isNotEmpty) {
      Map<String, dynamic>? row = l_FetchedDATA.first;
      ModDefineCustomer l_ModDefineCustomer = ModDefineCustomer(
        Pr_CustID: row?['CustID'],
        Pr_CB: row?['CB'],
      );


    }
  }

  Future<List<ModDefineCustomer>>  Fnc_ReadNew(String l_WhereClause) async {
    Database? lDatabase = await DBHelper().FncGetDatabaseIns();

    String l_Query = "Select PKGUID, CustID, CB From TBUCustomer " ;
  String   finalQiery = l_Query+l_WhereClause;
    List<Map<String, dynamic>> l_FetchedDATA = await lDatabase!.rawQuery(finalQiery);

    List<ModDefineCustomer> l_test = [];
    l_FetchedDATA.forEach((map) {
      String PKGUID = map['PKGUID'];
      String CustID = map['CustID'];
      String CB = map['CB'];

      ModDefineCustomer l_ModDefineCustomer = ModDefineCustomer(
        Pr_PKGUID: PKGUID ,
          Pr_CustID: CustID,
          Pr_CB: CB
      );
      l_test.add(l_ModDefineCustomer);
    });

    return l_test;
  }

}
