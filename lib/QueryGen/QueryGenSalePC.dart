import 'package:pccrud/MVVM/Model/DB/ModSaleDB.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDetailsDB.dart';

import '../../MVVM/Model/DB/ModPcSale.dart';
import 'QueryGenSaleDetails.dart';
import 'QueryGenSaleMain.dart';

class QueryGenSalePc {
  Future<List<String>> FncGenCrudQueriesSalePc(ModPcSale l_ModPcSale) async {
    try {
      List<String> lSalePcQueries = [];
      List<ModSale> l_listModSale = [];
      ModSale l_ModSale =  l_ModPcSale;
      l_listModSale.add(l_ModSale);
      // Call QueryGenSaleMain
      final l_QueryGenSaleMain = QueryGenSaleMain();
      List<String> l_ListSaleMainQueries = await l_QueryGenSaleMain.FncGenCrudQueriesSaleMainList(l_listModSale);
      lSalePcQueries.addAll(l_ListSaleMainQueries);

      // Call QueryGenSaleDetail
      final l_QueryGenSaleDetail = QueryGenSaleDetail();

      List<ModSaleDetails>  l_ListModSaleDetails = l_ModPcSale.l_PCSaleDetailsDBList;
     List<String> l_ListSaleDetailQueries = await l_QueryGenSaleDetail.FncGenCrudQueriesSaleDetailsList(l_ListModSaleDetails);
      lSalePcQueries.addAll(l_ListSaleDetailQueries);

      return lSalePcQueries;
    } catch (e) {
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }
}
