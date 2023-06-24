import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModPcSale.dart';
import 'package:pccrud/QueryGen/QueryGenImage.dart';
import 'package:sqflite/sqflite.dart';
import '../MVVM/Model/DB/ModImages.dart';
import '../QueryGen/QueryGenSalePC.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

class DAL_Image extends GetxController {
  Future<bool> Fnc_Cud(Modimamge l_Modimamge) async {
    try {
      Database? lDatabase = await DBHelper().FncGetDatabaseIns();
      String l_Query = await QueryGenImage().FncGenCrudQueriesImageModel(l_Modimamge);
      final batch = lDatabase!.batch();


      batch.execute(l_Query);


      await batch.commit();
      return true; // Queries executed successfully
    } catch (e) {
      print('Error executing queries: $e');
      return false; // Queries failed to execute
    }
  }
}
