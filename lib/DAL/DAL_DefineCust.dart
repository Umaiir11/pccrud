import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';
import 'package:pccrud/QueryGen/QueryGenDefineCustomer.dart';
import 'package:sqflite/sqflite.dart';
import '../MVVM/ViewModel/VmCustomerDBList.dart';
import '../MVVM/ViewModel/Vm_Home.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

class DAL_DefineCust extends GetxController {
  Future<bool> Fnc_Cud(ModDefineCustomer lModCustomerDetails) async {
    Database? lDatabase = await DBHelper().FncGetDatabaseIns();
    List<String> l_Query = await QueryGenDefineCust().FncGenCrudQueriesDefineCust(lModCustomerDetails);

    final batch = lDatabase!.batch();

    for (String query in l_Query) {
      if (query.trim().toUpperCase().startsWith('SELECT')) {
        if (query.toUpperCase().contains('PKGUID')) {
          await FncFillModel(query);
        } else {
          await FncFetchData(query); // Execute separate method for fetching and storing data
        }
        return true;
      } else {
        batch.execute(query);
      }
    }

    await batch.commit();
    return true; // Return true after executing all queries in the loop
  }


  Future<void> FncFetchData(String query) async {
    Database? lDatabase = await DBHelper().FncGetDatabaseIns();
    List<Map<String, dynamic>> l_FetchedDATA = await lDatabase!.rawQuery(query);

    VmDefineCustomer? lVmDefineCustomer = Get.find<VmDefineCustomer>();

    // Clear the existing data before adding new data
    lVmDefineCustomer?.l_DefineCustomerListDB.clear();

    for (Map<String, dynamic> row in l_FetchedDATA) {
      ModDefineCustomer l_ModDefineCustomer = ModDefineCustomer(
        Pr_PKGUID: row['PKGUID'],
        Pr_CustID: row['CustID'],
        Pr_CB: row['CB'],
        Pr_ISD: row['ISD'],
        Pr_Operation: row['Operation'],
      );
      lVmDefineCustomer?.l_DefineCustomerListDB.add(l_ModDefineCustomer);
    }

    // Rest of the code...
  }
 FncFillModel(String query) async {
    Database? lDatabase = await DBHelper().FncGetDatabaseIns();
    List<Map<String, dynamic>> l_FetchedDATA = await lDatabase!.rawQuery(query);

    if (l_FetchedDATA.isNotEmpty) {
      Map<String, dynamic> row = l_FetchedDATA.first;
      ModDefineCustomer l_ModDefineCustomer = ModDefineCustomer(
        Pr_CustID: row['CustID'],
        Pr_CB: row['CB'],
      );
      VmDefineCustomer? lVmDefineCustomer = Get.find<VmDefineCustomer>();
      lVmDefineCustomer.lExtractedModel = l_ModDefineCustomer;

    }


  }

}
