import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pccrud/MVVM/ViewModel/VmSingleMulti.dart';

import '../../customWidget/customShowDialog.dart';
import '../../customWidget/customSnackBar.dart';

class VwSingleMulti extends StatefulWidget {
  const VwSingleMulti({super.key});

  @override
  State<VwSingleMulti> createState() => _VwSingleMultiState();
}

class _VwSingleMultiState extends State<VwSingleMulti> {
  final VmSingleMulti l_VmSingleMulti = Get.put(VmSingleMulti());

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    l_VmSingleMulti.Sb_ResetDetailsForm()
;  }
  @override
  Widget build(BuildContext context) {
    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(

          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              CustomSnackBar lCustomsnackbar = CustomSnackBar();
              if (l_VmSingleMulti.G_ListModSingleMulti.isNotEmpty) {
                l_VmSingleMulti.BTN_DBSave_Click();
                lCustomsnackbar.FncCustSnackBAR("Alert", "Data Added", Colors.black);
              } else {

                lCustomsnackbar.FncCustSnackBAR("Alert", "Empty Data", Colors.deepOrange);
              }
            },
            backgroundColor: Colors.white, // Set the background color of the button
            foregroundColor: Colors.black,
            child: const Icon(Icons.save), // Set the color of the icon
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: SizedBox(
              height: PrHeight * .027,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  Obx(() {
                    return Padding(

                      padding: EdgeInsets.only(
                        right: PrWidth * 0.03,
                      ),
                      child: Text(
                        'Grand Total: \PKR ${l_VmSingleMulti.l_PvGrandTotal.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          resizeToAvoidBottomInset: false,
          body: Container(
            height: PrHeight,
            width: PrWidth,

            decoration: const BoxDecoration(

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
                    top: PrHeight * 0.04,
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
                              hintText: 'User Company',
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
                            controller: l_VmSingleMulti.l_Pr_QuanController,
                            decoration: InputDecoration(
                              hintText: 'Item Quantity',
                              hintStyle: const TextStyle(color: Colors.black26),
                              labelText: 'Quantity',
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
                            controller: l_VmSingleMulti.l_Pr_RateController,
                            decoration: InputDecoration(
                              hintText: 'Item Rate',
                              hintStyle: const TextStyle(color: Colors.black26),
                              labelText: 'Rate',
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
                                int parsedValue = int.tryParse(value) ?? 0;
                                l_VmSingleMulti.l_Pr_RateController.text =   parsedValue.toString();
                                if (parsedValue >= 0) {
                                  if (l_VmSingleMulti.l_Pr_QuanController.text.isEmpty  || l_VmSingleMulti.l_Pr_RateController.text.isEmpty) {
                                    l_VmSingleMulti.l_PrTotal.value = 0;
                                  } else {
                                    l_VmSingleMulti.FncFill_SaleDetailsModel();
                                  }
                                }
                              }

                          )),
                    ],
                  ),
                ),


                Padding(
                  padding: EdgeInsets.only(top: PrHeight * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: PrWidth * .745,
                        height: PrHeight * .055,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black12,
                          ),
                          padding: EdgeInsets.all(PrHeight * 0.015),
                          child: Obx(() {
                            return Text(
                              'Item Total: ${l_VmSingleMulti.l_PvItemTotal.value.toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            );
                          }),
                        ),
                      ),
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
                            l_VmSingleMulti.BTN_Add_Click();
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
                      l_VmSingleMulti.BTN_Clear_Click();
},
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Clear',
                              style: TextStyle(fontSize: 15),
                            ),
                          )),

                    ],

                  ),
                ),
                SizedBox(
                  height: PrHeight * 0.01,
                ),
                Expanded(
                  child: Obx(() =>
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: l_VmSingleMulti.G_ListModSingleMulti.length,
                        itemBuilder: (context, lListindex) {
                          final item = l_VmSingleMulti.G_ListModSingleMulti[lListindex];
                          return GestureDetector(
                            onTap: () async {
                              bool operationSuccessful = await l_VmSingleMulti.FncGetSelectedPKGUID(lListindex);
                              print(lListindex);
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
                                        //AlertDialogUpdate
                                        IconButton(
                                          iconSize: 12.0,
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {

                                          },
                                        ),
                                        const Text(
                                          'Sale Details',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        //DeleteButton
                                        IconButton(
                                          icon: const Icon(Icons.delete, color: Colors.red),
                                          iconSize: 12.0,
                                          onPressed: () {},
                                        )
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
                                                text: 'UserName: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: item.Pr_UserName.toString(),
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
                                                text: 'UserCity: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: item.Pr_UserCity.toString(),
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: PrWidth * 0.05,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Item Total: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: item.Pr_Itemtotal.toString(),
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
                                          width: PrWidth * 0.35,
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                )

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
