import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/ViewModel/VmCustomerDBList.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';

import '../Model/DB/ModDefineCustomer.dart';


class Vw_CustomerDBList extends StatefulWidget {
  const Vw_CustomerDBList({Key? key}) : super(key: key);

  @override
  State<Vw_CustomerDBList> createState() => _Vw_CustomerDBListState();
}

class _Vw_CustomerDBListState extends State<Vw_CustomerDBList> {
  final VmCustomerDBList l_VmCustomerDBList = Get.put(VmCustomerDBList());
  final VmDefineCustomer? lVmDefineCustomer = Get.find<VmDefineCustomer>();
  @override
  void initState() {
    super.initState();
    l_VmCustomerDBList.FncReciveList(); // Fetch data from the view model here
  }
  Widget build(BuildContext context) {



    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(
        resizeToAvoidBottomInset: false,

        body: SingleChildScrollView(
          reverse: false,
          child: Container(
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
            //color: Colors.black,
            padding: const EdgeInsets.all(16.0),
            // we use child container property and used most important property column that accepts multiple widgets

            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: PrHeight * 0.03,
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "DATABASE DATA",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                //TextWidgets
                // Display the list builder here
                Expanded(
                  child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: l_VmCustomerDBList.l_DefineCustomerListDB.length,
                    itemBuilder: (context, lListindex) {
                      final item = l_VmCustomerDBList.l_DefineCustomerListDB[lListindex];
                      return GestureDetector(
                        onTap: () {
                         l_VmCustomerDBList.FncGetSelectedPKGUID(lListindex);
                        },
                        child: SizedBox(
                          height: PrHeight * .132,
                          child: Card(
                            color: Colors.cyan,
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Sale Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    // DeleteButton
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: PrWidth * 0.05,
                                    ),
                                    SizedBox(
                                      width: PrWidth * 0.03,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'Item: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: item.Pr_CustID.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: PrWidth * 0.03,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'Quantity: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: item.Pr_CB.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )),
                )

              ],
            ),
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
