import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pccrud/DAL/DAL_DefineCust.dart';
import 'package:pccrud/MVVM/View/VwCustomerDBList.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';

import '../../Routing/AppRoutes.dart';
import '../../customWidget/customSnackBar.dart';
import '../ViewModel/Vm_Home.dart';

class VwDefineCustomer extends StatefulWidget {
  const VwDefineCustomer({Key? key}) : super(key: key);

  @override
  State<VwDefineCustomer> createState() => _VwDefineCustomerState();
}

class _VwDefineCustomerState extends State<VwDefineCustomer> {
  final GlobalKey<FormState> G_ValidationKey = GlobalKey<FormState>();
  final VmDefineCustomer l_VmDefineCustomer = Get.put(VmDefineCustomer());
  final VmHome? lVmHome = Get.find<VmHome>();

  //Controllers For Sale TextFields
  final TextEditingController l_CustIDController = TextEditingController();
  final TextEditingController l_CBController = TextEditingController();
  CustomSnackBar l_CustomSnackBar = CustomSnackBar();

  @override
  Widget build(BuildContext context) {
    //For Sale TextFields
    if (l_VmDefineCustomer.lExtractedModel != null)
      {
      l_CustIDController.text = l_VmDefineCustomer.lExtractedModel!.Pr_CustID.toString();
      l_CBController.text =  l_VmDefineCustomer.lExtractedModel!.Pr_CB.toString();
    }


    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: G_ValidationKey,
          child: SingleChildScrollView(
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
                      top: PrHeight * 0.10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Enter your customer information",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //TextWidgets
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
                              controller: l_CustIDController,
                              decoration:InputDecoration(
                                hintText: 'Customer ID',
                                hintStyle: const TextStyle(color: Colors.black26),
                                labelText: 'Customer id',
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
                              onChanged: (value) {
                                l_VmDefineCustomer.Pr_txtCustID_Text = value;
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
                              controller: l_CBController,

                              decoration:InputDecoration(
                                hintText: 'Created By',
                                hintStyle: const TextStyle(color: Colors.black26),
                                labelText: ' Created by',
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
                                  return 'Please enter a Created By';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                l_VmDefineCustomer.Pr_txtPr_CB_Text = value;
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              if (G_ValidationKey.currentState!.validate()) {
                                if (l_VmDefineCustomer.G_savedModDefineCustomer?.Pr_Operation == 1) {
                                  l_VmDefineCustomer.Fnc_Set_Model_Data();
                                  l_VmDefineCustomer.G_savedModDefineCustomer?.Pr_ISD = 'true';
                                  DAL_DefineCust().Fnc_Cud(l_VmDefineCustomer.G_savedModDefineCustomer!);
                                    l_CustomSnackBar.FncCustSnackBAR("Alert", "Data Added",
                                        Colors.black38);
                                    l_CustIDController.clear();
                                    l_CBController.clear();
                                  }
                                  else  if(l_VmDefineCustomer.G_savedModDefineCustomer?.Pr_Operation == 5){
                                  l_VmDefineCustomer.Fnc_Set_Model_Data();
                                  l_VmDefineCustomer.G_savedModDefineCustomer?.Pr_Operation=5;
                                  if(await DAL_DefineCust().Fnc_Cud(l_VmDefineCustomer.G_savedModDefineCustomer!)){

                                    l_CustomSnackBar.FncCustSnackBAR("Alert", "Data Updated",
                                        Colors.black);
                                    l_VmDefineCustomer.l_DefineCustomerListDB.refresh();

                                    l_CustIDController.clear();
                                    l_CBController.clear();
                                    l_VmDefineCustomer.G_savedModDefineCustomer?.Pr_Operation=1;

                                  }



                                  }

                                  // l_VmDefineCustomer.FncClearData(l_CustIDController, l_CBController);
                                else {
                                  l_CustomSnackBar.FncCustSnackBAR("Alert", "Not Added",
                                      Colors.black );
                                }
                              } else {
                                l_VmDefineCustomer.l_TextFieldsValidation.value = true;
                              }
                            },
                            child: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Save',
                                style: TextStyle(fontSize: 15),
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () async {
                              if (G_ValidationKey.currentState!.validate()) {
                                l_VmDefineCustomer.FncNewForm(l_CBController,l_CustIDController);
                              } else {
                                l_VmDefineCustomer.l_TextFieldsValidation.value = true;
                              }
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
                              l_VmDefineCustomer.G_savedModDefineCustomer?.Pr_Operation = lVmHome?.Pr_txtOperatio = 2;
                              Get.toNamed(AppRoutes.VwcustomDBlist);


                            },
                            child: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Search',
                                style: TextStyle(fontSize: 15),
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () async {
                              if (G_ValidationKey.currentState!.validate()) {
                                if (l_VmDefineCustomer.G_savedModDefineCustomer != null) {
                                  l_VmDefineCustomer.G_savedModDefineCustomer?.Pr_Operation = lVmHome?.Pr_txtOperatio =4;
                                  if (await l_VmDefineCustomer.FncDelDATA() == true) {
                                    l_CustomSnackBar.FncCustSnackBAR(
                                        "Alert", "Data Deleted",  Colors.black);
                                    l_VmDefineCustomer.l_DefineCustomerListDB.refresh();
                                    l_CustIDController.clear();
                                    l_CBController.clear();

                                  }
                                  // l_VmDefineCustomer.FncClearData(l_CustIDController, l_CBController);
                                } else {
                                  l_CustomSnackBar.FncCustSnackBAR(
                                      "Alert", "Data Not Deleted",
                                      Colors.redAccent);
                                }
                              }
                              else {
                                l_VmDefineCustomer.l_TextFieldsValidation.value = true;
                              }
                            },

                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent, // Set the background color to red
                            ),
                            child: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Delete',
                                style: TextStyle(fontSize: 15,color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                  ),



                ],
              ),
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
