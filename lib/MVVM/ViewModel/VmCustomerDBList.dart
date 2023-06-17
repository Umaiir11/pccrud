import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';
import '../../DAL/DAL_DefineCust.dart';

class VmCustomerDBList extends GetxController {

  VmDefineCustomer? lVmDefineCustomer = Get.find<VmDefineCustomer>();
  RxList<ModDefineCustomer> l_RxListModDefineCustomer = <ModDefineCustomer>[].obs;



  Future<bool> FncGetSelectedPKGUID(int index) async {
    String? lSelectedpkghuid = l_RxListModDefineCustomer[index].Pr_PKGUID;
    if (lSelectedpkghuid != null) {
      return await lVmDefineCustomer!.Sb_SearchData(lSelectedpkghuid) ?? true;
    }
    return false;
  }




  Future<bool> FetchDB_DATA() async {
    List<ModDefineCustomer> lListmoddefinecustomer =await DAL_DefineCust().Fnc_ReadNew("");
    l_RxListModDefineCustomer.addAll(lListmoddefinecustomer);
    return true;
  }
  }

