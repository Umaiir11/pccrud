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
      List<String> lQuery = await QueryGenDefineCust().FncGenCrudQueriesDefineCust(lModCustomerDetails);

      final batch = lDatabase!.batch();

      for (String query in lQuery) {
        batch.execute(query);
      }

      await batch.commit();
      return true;
    } catch (e) {
      print("Error executing queries: $e");
      return false;
    }
  }

  Future<bool> Fnc_Read(ModDefineCustomer lModCustomerDetails, String lWhereclause) async {
    try {
      List<String> lQuery = await QueryGenDefineCust().FncGenCrudQueriesDefineCust(lModCustomerDetails);
      for (String query in lQuery) {
        if (query.trim().toUpperCase().startsWith('SELECT')) {
          String finalQuery = query + lWhereclause;
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
    List<Map<String, dynamic>> lFetcheddata = await lDatabase!.rawQuery(query);

    VmDefineCustomer? lVmDefineCustomer = Get.find<VmDefineCustomer>();

    for (Map<String, dynamic> row in lFetcheddata) {
      ModDefineCustomer lModdefinecustomer = ModDefineCustomer(
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
    List<Map<String, dynamic>> lFetcheddata = await lDatabase!.rawQuery(query);

    if (lFetcheddata.isNotEmpty) {
      Map<String, dynamic>? row = lFetcheddata.first;
      ModDefineCustomer lModdefinecustomer = ModDefineCustomer(
        Pr_CustID: row['CustID'],
        Pr_CB: row['CB'],
      );
    }
  }

  Future<List<ModDefineCustomer>> Fnc_ReadNew(String lWhereclause) async {
    Database? lDatabase = await DBHelper().FncGetDatabaseIns();

    String lQuery = "Select PKGUID, CustID, CB From VW_TBU_Customer ";
    String finalQiery = lQuery + lWhereclause;

    List<Map<String, dynamic>> lFetcheddata = await lDatabase!.rawQuery(finalQiery);

    List<ModDefineCustomer> lTest = [];
    for (var map in lFetcheddata) {
      String PKGUID = map['PKGUID'];
      String CustID = map['CustID'];
      String CB = map['CB'];

      ModDefineCustomer lModdefinecustomer = ModDefineCustomer(Pr_PKGUID: PKGUID, Pr_CustID: CustID, Pr_CB: CB);
      lTest.add(lModdefinecustomer);
    }

    return lTest;
  }
}
