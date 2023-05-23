import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../MVVM/Model/DB/ModSaleDB.dart';
import '../QueryGen/QueryGenSaleInfo.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

class DALSaleInfo extends GetxController {
  Fnc_CudSaleInfo(ModSaleDB l_SaleInfo) async {
    Database? l_Database = await DBHelper().FncGetDatabaseIns();
    List<String> l_InsertionQuery = await QueryGenSaleInfo().FncGenCrudQueriesSaleInfo(l_SaleInfo);

    final batch = l_Database!.batch();
    for (int indexoflist = 0; indexoflist < l_InsertionQuery.length; indexoflist++) {
      final query = l_InsertionQuery[indexoflist];
      batch.execute(query);
    }
    await batch.commit();
  }
}
