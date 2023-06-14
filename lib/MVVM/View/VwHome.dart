import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/View/VwSale.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';
import 'package:pccrud/MVVM/ViewModel/Vm_Home.dart';

import '../../App Routes/AppRoutes.dart';
import '../ViewModel/VmSale.dart';
import 'VwDefineCustomer.dart';

class VwHome extends StatefulWidget {
  const VwHome({Key? key}) : super(key: key);

  @override
  State<VwHome> createState() => _VwHomeState();
}

class _VwHomeState extends State<VwHome> {
  final VmHome l_VmHome = Get.put(VmHome());
  final VmSale l_VmSale = Get.put(VmSale());
  final VmDefineCustomer l_VmDefineCustomer = Get.put(VmDefineCustomer());

  @override
  Widget build(BuildContext context) {
    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(
        body: Container(
          height: PrHeight,
          width: PrWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/bk.png"), fit: BoxFit.cover),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
              ],
              stops: [0.1, 0.5, 0.7, 0.9],
            ),
          ),
          child: Column(
            children: [

              SizedBox(height: PrHeight*0.40 ,),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      l_VmSale.FncNewForm(TextEditingController(),TextEditingController());
                      Get.to(() => const VwSale());

                      Get.toNamed(AppRoutes.VwSale);
                    },
                    child: const Text("CREATE!")),
              ),
              SizedBox(height: PrHeight*0.02 ,),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      l_VmDefineCustomer.FncNewForm(TextEditingController(), TextEditingController());
                      //Get.offNamed(AppRoutes.VwDefineCust);
                      Get.offNamedUntil(AppRoutes.VwDefineCust, ModalRoute.withName(AppRoutes.initialRoute));

                    },
                    child: const Text("Define Customer!")),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        //when tap anywhere on screen keyboard dismiss
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              //Get device's screen height and width.
              double height = constraints.maxHeight;
              double width = constraints.maxWidth;

              if (width >= 300 && width < 500) {
                return _WidgetportraitMode(height, width);
              } else {
                return _WidgetportraitMode(height, width);
              }
            },
          );
        },
      ),
    );
  }
}
