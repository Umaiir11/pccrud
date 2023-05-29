import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'ModSaleDB.dart';
import 'ModSaleDetailsDB.dart';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'ModSaleDB.dart';
import 'ModSaleDetailsDB.dart';

class ModPcSale extends ModSaleDB {
  RxList<ModSaleDetailsDB> l_ModSaleDetailsDBList = <ModSaleDetailsDB>[].obs;

  Map<String, dynamic> toJson() {
    final jsonMap = super.UserToJson(); // Call the superclass's toJson method

    // Convert l_ModSaleDetailsDBList to JSON
    jsonMap['l_ModSaleDetailsDBList'] = l_ModSaleDetailsDBList.map((item) => item.UserToJson()).toList();

    return jsonMap;
  }
}
