import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';
import 'package:uuid/uuid.dart';

import 'Vm_Home.dart';

class VmCustomerDBList extends GetxController {

  VmDefineCustomer? lVmDefineCustomer = Get.find<VmDefineCustomer>();
  RxList<ModDefineCustomer> l_DefineCustomerListDB = <ModDefineCustomer>[].obs;

   FncReciveList(){
     l_DefineCustomerListDB = lVmDefineCustomer!.FncGetDefineCustomerList();

   }

}
