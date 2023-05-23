import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDetailsDB.dart';
import 'package:sqflite/sqflite.dart';
import '../QueryGen/QueryGenSaleDetails.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDetailsDB.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDB.dart';
import 'package:sqflite/sqflite.dart';

import '../QueryGen/QueryGenSaleDetails.dart';
import '../QueryGen/QueryGenSaleInfo.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

class DAL_PC extends GetxController {
  Fnc_CudSaleDetails(List<ModSaleDetailsDB> l_SaleDetailsList, ModSaleDB l_ModSaleDB) async {
    Database? l_Database = await DBHelper().FncGetDatabaseIns();

    List<String> l_SaleDetailsQueries = await QueryGenSaleDetails().FncGenCrudQueriesSaleDetails(l_SaleDetailsList);
    List<String> l_SaleInfoQueries = await QueryGenSaleInfo().FncGenCrudQueriesSaleInfo(l_ModSaleDB);

    final batch = l_Database!.batch();

    for (String query in l_SaleDetailsQueries) {
      batch.execute(query);
    }

    for (String query in l_SaleInfoQueries) {
      batch.execute(query);
    }

    await batch.commit();

    // Clear the lists after the data is stored in the database.
    l_SaleDetailsList.clear();
  }
}
