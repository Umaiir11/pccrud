import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';
import 'package:sqflite/sqflite.dart';

import '../QueryGen/QueryGenSaleDetails.dart';
import '../QueryGen/QueryGenSaleInfo.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

class DAL_PC extends GetxController {
  Fnc_Cud(ModPcSale lModpcsale) async {
    Database? lDatabase = await DBHelper().FncGetDatabaseIns();

    List<String> lSaleinfoqueries = await QueryGenSaleInfo().FncGenCrudQueriesSaleInfo(lModpcsale);
    List<String> lSaledetailsqueries = await QueryGenSaleDetails().FncGenCrudQueriesSaleDetails(lModpcsale);
    final batch = lDatabase!.batch();
    for (String query in lSaleinfoqueries) {
      batch.execute(query);
    }
    for (String query in lSaledetailsqueries) {
      batch.execute(query);
    }
    await batch.commit();
   // Clear the lists after the data is stored in the database.
    //l_SaleDetailsList.clear();
  }



}
