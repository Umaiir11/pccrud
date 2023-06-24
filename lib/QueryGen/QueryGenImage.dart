import 'package:pccrud/MVVM/Model/DB/ModImages.dart';

import '../../Enum/EnumCrud.dart';

class QueryGenImage {
  Future<List<String>> FncGenCrudQueriesImageList(List<Modimamge> list_Modimamge) async {
    try {
      List<String> lQueries = [];

      String? Query;
      for (Modimamge l_Modimamge in list_Modimamge) {
        Query =  await FncGenCrudQueriesImageModel(l_Modimamge);
        lQueries.add(Query);
      }
      return lQueries;
    } catch (e) {
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }


  Future<String> FncGenCrudQueriesImageModel(Modimamge l_Modimamge) async {
    try {

      switch (l_Modimamge.Pr_Operation) {
        case DBOPP.insert:
          return '''
            INSERT INTO TBU_SalesDetails (
              Item, Quantity, Rate, VmDID, Operation, PKGUID
            ) VALUES (
              '${l_Modimamge.Pr_Image}'
            )
          ''';


        default:
        // Handle unrecognized operation
          break;
      }
      return "";
    } catch (e) {
      throw Exception('An error occurred while generating CRUD queries: $e');
    }
  }

}
