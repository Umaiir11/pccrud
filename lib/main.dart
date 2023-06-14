import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'MVVM/View/VwHome.dart';
import 'Routing/AppRoutes.dart';
import 'Routing/GetRoutes.dart';

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
