import '../../MVVM/Model/DB/ModSaleDB.dart';
import '../../MVVM/Model/DB/ModSaleDetailsDB.dart';
import 'QueryGenSaleIMain.dart';
import 'QueryGenSaleDetail.dart';

class QueryGenSalePc {
  Future<List<String>> FncGenCrudQueriesSalePc(     ) async {
    try {
      List<String> lSalePcQueries = [];

      // Call QueryGenSaleMain
      final l_QueryGenSaleMain = QueryGenSaleMain();
      List<ModSale> listModSale = []; // Your list of ModSale objects
      List<String> saleMainQueries = await l_QueryGenSaleMain.FncGenCrudQueriesSaleInfo(listModSale);
      lSalePcQueries.addAll(saleMainQueries);

      // Call QueryGenSaleDetail
      final l_QueryGenSaleDetail = QueryGenSaleDetail();
      List<ModSaleDetails> listModSaleDetails = []; // Your list of ModSaleDetails objects
      List<String> saleDetailQueries = await l_QueryGenSaleDetail.FncGenCrudQueriesSaleDetails(listModSaleDetails);
      lSalePcQueries.addAll(saleDetailQueries);

      return lSalePcQueries;
    } catch (e) {
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }
}
