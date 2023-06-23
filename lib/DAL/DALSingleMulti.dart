import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModSingleMulti.dart';
import 'package:sqflite/sqflite.dart';
import '../QueryGen/QueryGenSingleMulti.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

class DAL_SingleMulti extends GetxController {
  Future<bool> Fnc_Cud( List<ModSingleMulti> l_listModSingleMulti) async {
    try {
      Database? lDatabase = await DBHelper().FncGetDatabaseIns();
      List<String> l_Quries = await   QueryGenSingleMulti().FncGenCrudQueriesSaleDetailsList(l_listModSingleMulti);
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


  Future<List<ModSingleMulti>> Fnc_Read(String lWhereclause) async {
    try {
      Database? lDatabase = await DBHelper().FncGetDatabaseIns();

      String lQuery = "Select PKGUID, UserName, UserCompany From VW_TBU_SingleMulti ";
      String finalQuery = lQuery + lWhereclause;

      List<Map<String, dynamic>> lFetchedData = await lDatabase!.rawQuery(finalQuery);

      List<ModSingleMulti> lTest = [];
      for (var map in lFetchedData) {
        String PKGUID = map['PKGUID'];
        String UserCompany = map['UserCompany'];
        String UserName = map['UserName'];

        ModSingleMulti lModSingleMulti =
        ModSingleMulti(Pr_PKGUID: PKGUID, Pr_UserCompany: UserCompany,Pr_UserName:UserName );
        lTest.add(lModSingleMulti);
      }

      return lTest;
    } catch (e) {
      // Throw an exception
      throw Exception('An error occurred while reading data: $e');
    }
  }


}
