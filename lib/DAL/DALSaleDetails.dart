import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDetailsDB.dart';
//import 'package:sqflite/sqflite.dart';
//import '../cmModule/DbHelper/DbHelperClass.dart';

class DALSaleDetails extends GetxController {
  Fnc_CudSaleDetails(List<ModSaleDetailsDB> lSaledetailslist) async {
    //Database? lDatabase = await DBHelper().FncGetDatabaseIns();
    //List<String> l_InsertionQuery = await QueryGenSaleDetails().FncGenCrudQueriesSaleDetails(l_SaleDetailsList);

  //  final batch = l_Database!.batch();
   // for (int indexoflist = 0; indexoflist < l_InsertionQuery.length; indexoflist++) {
   //   final query = l_InsertionQuery[indexoflist];
    //  batch.execute(query);
  //  }
  //  await batch.commit();

    // Clear the list after the data is stored on the database.
  //  l_SaleDetailsList.clear();
  }
}
