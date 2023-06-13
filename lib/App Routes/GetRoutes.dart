import 'package:get/get.dart';
import 'package:pccrud/App Routes/AppRoutes.dart';
import 'package:pccrud/MVVM/View/VwCustomerDBList.dart';
import 'package:pccrud/MVVM/View/VwDefineCustomer.dart';
import 'package:pccrud/MVVM/View/VwHome.dart';

class GetAppRoutes {
  static List<GetPage> Fnc_GetPages() {
    return [
      GetPage(name: AppRoutes.initialRoute, page: () => VwHome()),
      GetPage(name: AppRoutes.VwDefineCust, page: () => VwDefineCustomer()),
      GetPage(name: AppRoutes.VwcustomDBlist, page: () => Vw_CustomerDBList()),
    ];
  }
}
