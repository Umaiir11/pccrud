import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pccrud/App%20Routes/AppRoutes.dart';
import 'package:pccrud/MVVM/View/VwDefineCustomer.dart';
import 'package:pccrud/test.dart';

import 'App Routes/GetRoutes.dart';
import 'MVVM/View/VwCustomerDBList.dart';
import 'MVVM/View/VwHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      getPages: GetAppRoutes.Fnc_GetPages(),
      initialRoute: AppRoutes.initialRoute,


      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home:  VwHome(),
    );
  }
}
