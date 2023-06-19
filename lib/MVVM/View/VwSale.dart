import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDetailsDB.dart';
import 'package:pccrud/MVVM/ViewModel/VmSaleDetails.dart';
import 'package:pccrud/Validation/DVMPC.dart';
import 'package:tuple/tuple.dart';

import '../../DAL/DAL_PC.dart';
import '../../customWidget/customShowDialog.dart';
import '../../customWidget/customSnackBar.dart';
import '../ViewModel/VmSale.dart';

class VwSale extends StatefulWidget {
  const VwSale({Key? key}) : super(key: key);

  @override
  State<VwSale> createState() => _VwSaleState();
}

class _VwSaleState extends State<VwSale> {
  final GlobalKey<FormState> G_MainValidationKey = GlobalKey<FormState>();
  final GlobalKey<FormState> G_DialogValidationKey = GlobalKey<FormState>();
  final VmSale l_VmSale = Get.put(VmSale());
  final VmSaleDetails l_VmSaleDetails = Get.put(VmSaleDetails());

  //Controllers For Sale TextFields


  void initState() {
    super.initState();
    l_VmSale.Sb_ResetForm();
    // Fetch data from the view model here
  }



  @override
  Widget build(BuildContext context) {
    //For Sale TextFields

    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {

            if (l_VmSale.G_ListItemQuery.isNotEmpty) {
              l_VmSale.FncFillPCModelList();
              Tuple2<List<String>?, List<String>?> errors =  DVMSalePC.Fnc_Validate(l_VmSale.l_ModPcSale);
              DAL_PC().Fnc_Cud(l_VmSale.l_ModPcSale);
            } else {
              CustomSnackBar lCustomsnackbar = CustomSnackBar();
              lCustomsnackbar.FncCustSnackBAR("Alert", "Empty Data", Colors.deepOrange);
            }
          },
          backgroundColor: Colors.lightBlueAccent, // Set the background color of the button
          foregroundColor: Colors.black,
          child: const Icon(Icons.save), // Set the color of the icon
        ),
        body: Form(
          key: G_MainValidationKey,
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
                      top: PrHeight * 0.03,
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Enter your sale information",
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
                          controller: l_VmSale. l_Pr_CustIDController,
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
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: PrHeight * 0.01,
                    ),
                    child: SizedBox(
                        width: PrWidth * .745,
                        child: TextFormField(
                            controller: l_VmSale. l_Pr_VoucherController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.lightBlueAccent,
                              hintText: 'Voucher',
                              hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.all(PrHeight * 0.007),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Voucher';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              if (l_VmSale.Pv_txtCustID_Text.isNotEmpty && l_VmSale.Pv_txtVoucher_Text.isNotEmpty) {
                                l_VmSale.FncFill_SaleModel();
                              }
                            })),
                  ),


                  Padding(
                    padding: EdgeInsets.only(
                      top: PrHeight * 0.01,
                    ),
                    child: SizedBox(
                        width: PrWidth * .745,
                        height: PrHeight * .055,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(PrHeight * 0.007),
                            child: Obx(() {
                              return Text(
                                'Grand Total: ${l_VmSale.Pv_txtGrandTotal_Text.toString()}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              );
                            }))),
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
                              CustomSnackBar lCustomsnackbar = CustomSnackBar();
                              if (G_MainValidationKey.currentState!.validate()) {
                                CustomAlertDialog lCustomaddalertdialog = CustomAlertDialog();
                                lCustomaddalertdialog.FncCustAlertDialog(
                                  // CustAlertDialog fill the ModSaleDetails Model from texxt field
                                    context,
                                    PrHeight,
                                    PrWidth,
                                    G_DialogValidationKey,
                                    "Sale Details",
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (G_DialogValidationKey.currentState!.validate()) {
                                          //ModSalesDetails Model assign to the List of ItemQuery
                                          l_VmSale.FncFillItemQuery();
                                          l_VmSaleDetails.FncClearDialog(lCustomaddalertdialog);
                                          lCustomsnackbar.FncCustSnackBAR("Alert", "Data Added",  Colors.black);
                                        } else {
                                          l_VmSaleDetails.l_TextFieldsValidation.value = true;
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white, backgroundColor: Colors.lightGreen,
                                        elevation: 7,
                                        // minimumSize: Size(150, 48),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: const Text(
                                        "Add",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    -1);
                                //SaleDetails Dialog
                              } else {
                                l_VmSale.l_TextFieldsValidation.value = true;
                              }
                            },
                            child: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Insert',
                                style: TextStyle(fontSize: 15),
                              ),
                            )),

                        ElevatedButton(
                            onPressed: () {
                              l_VmSale.FncNewForm(l_VmSale. l_Pr_CustIDController,l_VmSale.l_Pr_VoucherController);
                              Get.to(() => const VwSale());
                            },
                            child: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Reset',
                                style: TextStyle(fontSize: 15),
                              ),
                            )),
                      ],
                    ),
                  ),



                  SizedBox(
                    height: PrHeight * 0.01,
                  ),
                  // Display the list builder here
                  Expanded(
                    child: Obx(() => ListView.builder(
                          shrinkWrap: true,
                          itemCount: l_VmSale.G_ListItemQuery.length,
                          itemBuilder: (context, lListindex) {
                            final item = l_VmSale.G_ListItemQuery[lListindex];
                            return SizedBox(
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
                                            CustomSnackBar lCustomsnackbar = CustomSnackBar();
                                            CustomAlertDialog lUpdatecustomalertdialog = CustomAlertDialog();
                                            lUpdatecustomalertdialog.FncCustAlertDialog(
                                                context,
                                                PrHeight,
                                                PrWidth,
                                                G_DialogValidationKey,
                                                "Update Data",
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    if (G_DialogValidationKey.currentState!.validate()) {
                                                      ModSaleDetails lModSaleDetailsDB =
                                                          l_VmSaleDetails.FncFill_SaleDetailsModel();
                                                      l_VmSaleDetails.FncSaleUpdateDetailsModel(
                                                          lModSaleDetailsDB, lUpdatecustomalertdialog);
                                                      l_VmSale.FncUpdateList(lListindex, lModSaleDetailsDB);

                                                      lCustomsnackbar.FncCustSnackBAR(
                                                          "Alert",
                                                          "Data Updated",

                                                          Colors.black);
                                                      // Close the dialog
                                                      Navigator.of(context).pop();
                                                      l_VmSaleDetails.FncClearDialog(lUpdatecustomalertdialog);
                                                    } else {
                                                      l_VmSaleDetails.l_TextFieldsValidation.value = true;
                                                    }
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    foregroundColor: Colors.white,
                                                    backgroundColor: Colors.lightGreen,
                                                    elevation: 7,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    "Update",
                                                    style: TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                                lListindex);
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
                                          onPressed: () {
                                            CustomSnackBar lCustomsnackbar = CustomSnackBar();
                                            // Get the item at the current index
                                            ModSaleDetails item = l_VmSale.G_ListItemQuery[lListindex];

                                            // Subtract the item total from the grand total
                                            l_VmSale.Pv_txtGrandTotal_Text -= item.Pr_ItemTotal!;

                                            // Remove the current item from the list
                                            l_VmSale.G_ListItemQuery.removeAt(lListindex);
                                            lCustomsnackbar.FncCustSnackBAR("Alert", "Deleted",  Colors.black);
                                          },
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
                                                text: 'Item: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: item.Pr_Item.toString(),
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
                                                text: item.Pr_Quantity.toString(),
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
                                                text: 'Rate: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: item.Pr_Rate.toString(),
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
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Total: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: item.Pr_ItemTotal.toString(),
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
                                    )
                                  ],
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
