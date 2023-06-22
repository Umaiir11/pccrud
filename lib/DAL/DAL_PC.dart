import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';
import 'package:sqflite/sqflite.dart';
import '../QueryGen/QueryGenSalePC.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

class DAL_PC extends GetxController {
  Fnc_Cud( ModPcSale l_Modpcsale) async {
    Database? lDatabase = await DBHelper().FncGetDatabaseIns();
    List<String> l_Quries = await QueryGenSalePc().FncGenCrudQueriesSalePc( l_Modpcsale );
    final batch = lDatabase!.batch();
    for (String query in l_Quries) {
      batch.execute(query);
    }
    await batch.commit();
  }
}