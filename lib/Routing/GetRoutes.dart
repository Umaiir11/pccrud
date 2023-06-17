import 'package:get/get.dart';
import 'package:pccrud/MVVM/View/VwCustomerDBList.dart';
import 'package:pccrud/MVVM/View/VwDefineCustomer.dart';
import 'package:pccrud/MVVM/View/VwHome.dart';

import '../MVVM/View/VwSale.dart';
import 'AppRoutes.dart';

class GetAppRoutes {
  static List<GetPage> Fnc_GetPages() {
    return [
      GetPage(name: AppRoutes.initialRoute, page: () => const VwHome()),
      GetPage(name: AppRoutes.VwDefineCust, page: () => const VwDefineCustomer()),
      GetPage(name: AppRoutes.VwcustomDBlist, page: () => const Vw_CustomerDBList()),
      GetPage(name: AppRoutes.VwSale, page: () => const VwSale()),
    ];
  }
}
