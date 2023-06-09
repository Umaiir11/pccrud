import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModDefineCustomer.dart';
import 'package:uuid/uuid.dart';

import 'Vm_Home.dart';

class VmCustomerDBList extends GetxController {


  RxList<ModDefineCustomer> l_DefineCustomerListDB = <ModDefineCustomer>[].obs;

}
