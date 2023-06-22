import 'package:get/get.dart';
import 'package:sqflite/sqlite_api.dart';
import '../MVVM/Model/DB/ModDefineCustomer.dart';
import '../QueryGen/QueryGenDefineCustomer.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

class DAL_DefineCust extends GetxController {
  Future<bool> Fnc_Cud(ModDefineCustomer lModDefineCustomer) async {
    try {
      Database? lDatabase = await DBHelper().FncGetDatabaseIns();
      String lQuery = await QueryGenDefineCust().FncGenCrudQueriesDefineCustModel(lModDefineCustomer);
      final batch = lDatabase!.batch();
      batch.execute(lQuery);
      await batch.commit();
      return true;
    } catch (e) {
      print("Error executing queries: $e");
      return false;
    }
  }
  Future<List<ModDefineCustomer>> Fnc_Read(String lWhereclause) async {
    try {
      Database? lDatabase = await DBHelper().FncGetDatabaseIns();

      String lQuery = "Select PKGUID, CustID, CB From VW_TBU_Customer ";
      String finalQuery = lQuery + lWhereclause;

      List<Map<String, dynamic>> lFetchedData = await lDatabase!.rawQuery(finalQuery);

      List<ModDefineCustomer> lTest = [];
      for (var map in lFetchedData) {
        String PKGUID = map['PKGUID'];
        String CustID = map['CustID'];
        String CB = map['CB'];

        ModDefineCustomer lModdefinecustomer = ModDefineCustomer(Pr_PKGUID: PKGUID, Pr_CustID: CustID, Pr_CB: CB);
        lTest.add(lModdefinecustomer);
      }

      return lTest;
    } catch (e) {
      // Throw an exception
      throw Exception('An error occurred while reading data: $e');
    }
  }

}