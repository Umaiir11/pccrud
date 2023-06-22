import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pccrud/MVVM/ViewModel/VmSingleMulti.dart';

class VwSingleMulti extends StatefulWidget {
  const VwSingleMulti({super.key});

  @override
  State<VwSingleMulti> createState() => _VwSingleMultiState();
}

class _VwSingleMultiState extends State<VwSingleMulti> {
  final VmSingleMulti l_VmSingleMulti = Get.put(VmSingleMulti());


  @override
  Widget build(BuildContext context) {
    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
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
          //color: Colors.black,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: PrHeight * 0.10,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Single Multi",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),


                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: PrHeight * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: PrWidth * .745,
                        child: TextFormField(
                          controller: l_VmSingleMulti.l_Pr_nameController,
                          decoration: InputDecoration(
                            hintText: 'User Name',
                            hintStyle: const TextStyle(color: Colors.black26),
                            labelText: 'Name',
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                const BorderSide(color: Colors.white38)),
                            contentPadding: EdgeInsets.all(PrHeight * 0.007),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a Customer ID';
                            }
                            return null;
                          },
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: PrHeight * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: PrWidth * .745,
                        child: TextFormField(
                         controller: l_VmSingleMulti.l_Pr_CityController,
                          decoration: InputDecoration(
                            hintText: 'User City',
                            hintStyle: const TextStyle(color: Colors.black26),
                            labelText: 'City',
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                const BorderSide(color: Colors.white38)),
                            contentPadding: EdgeInsets.all(PrHeight * 0.007),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a Customer ID';
                            }
                            return null;
                          },
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: PrHeight * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: PrWidth * .745,
                        child: TextFormField(
                         controller: l_VmSingleMulti.l_Pr_CompanyController,
                          decoration: InputDecoration(
                            hintText:  'User Company',
                            hintStyle: const TextStyle(color: Colors.black26),
                            labelText: 'Company',
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                const BorderSide(color: Colors.white38)),
                            contentPadding: EdgeInsets.all(PrHeight * 0.007),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a Customer ID';
                            }
                            return null;
                          },
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: PrHeight * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: PrHeight * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                         // if (G_ValidationKey.currentState!.validate()) {
                          //  l_VmDefineCustomer.BTNSave_Click();
                         // }
                        },
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'ADD',
                            style: TextStyle(fontSize: 15),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () async {
                         // l_VmDefineCustomer.BTNClear_Click();
                        },
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Clear',
                            style: TextStyle(fontSize: 15),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () async {
                         // l_VmDefineCustomer.BTNClear_Click();
                        },
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Delete',
                            style: TextStyle(fontSize: 15,color: Colors.white),
                          ),
                        ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent, // Set the background color to red
                      ),
                    ),

                  ],

                ),
              ),
              // Display the list builder here

            ],
          ),

        )
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
