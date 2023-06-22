import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';
import 'package:sqflite/sqflite.dart';
import '../QueryGen/QueryGenSalePC.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

class DAL_PC extends GetxController {
  Future<bool> Fnc_Cud(ModPcSale l_Modpcsale) async {
    try {
      Database? lDatabase = await DBHelper().FncGetDatabaseIns();
      List<String> l_Quries = await QueryGenSalePc().FncGenCrudQueriesSalePc(l_Modpcsale);
      final batch = lDatabase!.batch();

      for (String query in l_Quries) {
        batch.execute(query);
      }

      await batch.commit();
      return true; // Queries executed successfully
    } catch (e) {
      print('Error executing queries: $e');
      return false; // Queries failed to execute
    }
  }
}
