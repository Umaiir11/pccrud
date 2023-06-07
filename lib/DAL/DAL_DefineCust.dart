import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:pccrud/QueryGen/QueryGenDefineCustomer.dart';
import 'package:sqflite/sqflite.dart';
import '../cmModule/DbHelper/DbHelperClass.dart';

class DAL_DefineCust extends GetxController {
  Fnc_Cud(ModCustomerDetails lModCustomerDetails) async {
    Database? lDatabase = await DBHelper().FncGetDatabaseIns();

    List<String> lDefineCust = await QueryGenDefineCust().FncGenCrudQueriesDefineCust(lModCustomerDetails);

    final batch = lDatabase!.batch();

    for (String query in lDefineCust) {
      batch.execute(query);
    }
    await batch.commit();

    // Clear the lists after the data is stored in the database.
    //l_SaleDetailsList.clear();
  }
}
