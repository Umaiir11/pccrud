import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pccrud/MVVM/ViewModel/VmCustomerDBList.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';
import '../../Routing/AppRoutes.dart';
import '../ViewModel/Vm_Home.dart';
import 'VwDefineCustomer.dart';


class Vw_CustomerDBList extends StatefulWidget {
  const Vw_CustomerDBList({Key? key}) : super(key: key);

  @override
  State<Vw_CustomerDBList> createState() => _Vw_CustomerDBListState();
}

class _Vw_CustomerDBListState extends State<Vw_CustomerDBList> {
  final VmCustomerDBList l_VmCustomerDBList = Get.put(VmCustomerDBList());
  final VmDefineCustomer? lVmDefineCustomer = Get.find<VmDefineCustomer>();
  final VmHome? lVmHome = Get.find<VmHome>();
  @override

  void initState() {
    super.initState();
    l_VmCustomerDBList.FetchDB_DATA();
    l_VmCustomerDBList.FncReciveList();
    // Fetch data from the view model here
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
            child: Column(
              children: <Widget>[

                //Text use label
                Padding(
                  padding: EdgeInsets.only(
                    top: PrHeight * 0.08,
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
                //Show data on List Tiles  Using OBX list builder
                Expanded(
                  child: Obx(() {

                    if ( l_VmCustomerDBList.l_DefineCustomerListDB.isEmpty) {
                      return  Center(
                        child: SizedBox(
                          width: 280,
                          height: 200,
                          child: Lottie.asset('assets/eBox.json', fit: BoxFit.cover, repeat: true),
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount:  l_VmCustomerDBList.l_DefineCustomerListDB.length,
                      itemBuilder: (context, lListindex) {
                        final item =  l_VmCustomerDBList.l_DefineCustomerListDB[lListindex];

                        return GestureDetector(
                          onTap: () async {
                            bool operationSuccessful = await l_VmCustomerDBList
                                .FncGetSelectedPKGUID(lListindex);
                            print(lListindex);
                            if (operationSuccessful) {
                              lVmDefineCustomer?.G_Operation = 5;
                              Get.offUntil(
                                GetPageRoute(
                                  settings: RouteSettings(name: AppRoutes.VwDefineCust),
                                  page: () => VwDefineCustomer(),
                                ),
                                ModalRoute.withName(AppRoutes.initialRoute),
                              );
                            }
                          },
                          child: SizedBox(
                            height: PrHeight * .105,
                            child: Card(
                              color: Colors.cyan,
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: PrHeight * 0.02),
                                    child: Center(
                                      child: const Text(
                                        'Customer Information',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: PrHeight * 0.01),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Customer Name: ',
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
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Created By: ',
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),

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
