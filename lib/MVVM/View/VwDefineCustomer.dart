import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pccrud/DAL/DAL_DefineCust.dart';
import 'package:pccrud/MVVM/View/VwCustomerDBList.dart';
import 'package:pccrud/MVVM/ViewModel/VmDefineCustomer.dart';

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
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Enter your customer information",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  //TextWidgets
                  Padding(
                    padding: EdgeInsets.only(
                      top: PrHeight * 0.01,
                    ),
                    child: SizedBox(
                        width: PrWidth * .745,
                        child: TextFormField(
                          controller: l_CustIDController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.lightBlueAccent,
                            hintText: 'Customer ID',
                            hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            // Adjust the floating label behavior
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.all(PrHeight * 0.007), // Adjust the vertical padding as needed
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: PrHeight * 0.01,
                    ),
                    child: SizedBox(
                        width: PrWidth * .745,
                        child: TextFormField(
                          controller: l_CBController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.lightBlueAccent,
                            hintText: 'Created BY',
                            hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            // Adjust the floating label behavior
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.all(PrHeight * 0.007), // Adjust the vertical padding as needed
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a Customer ID';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            l_VmDefineCustomer.Pr_txtPr_CB_Text = value;
                          },
                        )),
                  ),

                  //AlertDialogInsertion

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
                                  l_VmDefineCustomer.FncFill_CustomerDetailsModel();
                                  l_VmDefineCustomer.G_savedModDefineCustomer?.Pr_ISD = 'true';
                                  DAL_DefineCust().Fnc_Cud(l_VmDefineCustomer.G_savedModDefineCustomer!);
                                    l_CustomSnackBar.FncCustSnackBAR("Alert", "Data Added", "Data Added Successfully",
                                        Colors.blue.shade800, Colors.blue.shade600);
                                    l_CustIDController.clear();
                                    l_CBController.clear();
                                  }
                                  else  if(l_VmDefineCustomer.G_savedModDefineCustomer?.Pr_Operation == 5){
                                  l_VmDefineCustomer.FncFill_CustomerDetailsModel();
                                  l_VmDefineCustomer.G_savedModDefineCustomer?.Pr_Operation=5;
                                    DAL_DefineCust().Fnc_Cud(l_VmDefineCustomer.G_savedModDefineCustomer!);

                                    l_CustomSnackBar.FncCustSnackBAR("Alert", "Data Updated", "Data Updated Successfully",
                                        Colors.blue.shade800, Colors.blue.shade600);
                                    l_VmDefineCustomer.l_DefineCustomerListDB.refresh();
                                    l_CustIDController.clear();
                                    l_CBController.clear();
                                  }

                                  // l_VmDefineCustomer.FncClearData(l_CustIDController, l_CBController);
                                else {
                                  l_CustomSnackBar.FncCustSnackBAR("Alert", "Not Added", "Please Add Data From Insert Button",
                                      Colors.redAccent, Colors.redAccent);
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
                              l_VmDefineCustomer.G_savedModDefineCustomer?.Pr_Operation = lVmHome?.Pr_txtOperatio = 2;

                              if (l_VmDefineCustomer.G_savedModDefineCustomer != null) {
                                if (await DAL_DefineCust().Fnc_Read(l_VmDefineCustomer.G_savedModDefineCustomer!,"")) {

                                  l_CustomSnackBar.FncCustSnackBAR("Alert", "Data Fetched", "Data Fetched Successfully",
                                      Colors.blue.shade800, Colors.blue.shade600);
                                  Get.to(() => const Vw_CustomerDBList());
                                }
                                // l_VmDefineCustomer.FncClearData(l_CustIDController, l_CBController);
                              } else {
                                l_CustomSnackBar.FncCustSnackBAR(
                                    "Alert", "Not Added", "Please Add Data From Insert Button", Colors.redAccent, Colors.redAccent);
                              }
                            },
                            child: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Search',
                                style: TextStyle(fontSize: 15),
                              ),
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
                        ElevatedButton(
                            onPressed: () async {
                              if (G_ValidationKey.currentState!.validate()) {
                                if (l_VmDefineCustomer.G_savedModDefineCustomer != null) {
                                  l_VmDefineCustomer.G_savedModDefineCustomer?.Pr_Operation = lVmHome?.Pr_txtOperatio =4;
                                  if (await l_VmDefineCustomer.FncDelDATA() == true) {
                                    l_CustomSnackBar.FncCustSnackBAR(
                                        "Alert", "Data Deleted", "Data Deleted Successfully",
                                        Colors.blue.shade800, Colors.blue.shade600);
                                    l_VmDefineCustomer.l_DefineCustomerListDB.refresh();
                                    l_CustIDController.clear();
                                    l_CBController.clear();

                                  }
                                  // l_VmDefineCustomer.FncClearData(l_CustIDController, l_CBController);
                                } else {
                                  l_CustomSnackBar.FncCustSnackBAR(
                                      "Alert", "Data Not Deleted", "Failed", Colors.redAccent,
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
