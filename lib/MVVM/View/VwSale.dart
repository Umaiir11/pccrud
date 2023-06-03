import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDetailsDB.dart';
import 'package:pccrud/MVVM/ViewModel/VmSaleDetails.dart';
import 'package:tuple/tuple.dart';

import '../../DAL/DAL_PC.dart';
import '../../Validation/DVMPC.dart';
import '../../customWidget/customShowDialog.dart';
import '../ViewModel/VmSale.dart';

class VwSale extends StatefulWidget {
  const VwSale({Key? key}) : super(key: key);

  @override
  State<VwSale> createState() => _VwSaleState();
}

class _VwSaleState extends State<VwSale> {
  @override
  final GlobalKey<FormState> G_MainValidationKey = GlobalKey<FormState>();
  final GlobalKey<FormState> G_DialogValidationKey = GlobalKey<FormState>();
  final VmSale l_VmSale = Get.put(VmSale());
  final VmSaleDetails l_VmSaleDetails = Get.put(VmSaleDetails());
  CustomAlertDialog l_CustomAlertDialog = new CustomAlertDialog();

  //final DBHelper l_DBHelper = Get.put(DBHelper());
  //ModPcSale l_ModPcSale = ModPcSale();

  //Controllers For Sale TextFields
  final TextEditingController l_Pr_CustIDController = TextEditingController();
  final TextEditingController l_Pr_VoucherController = TextEditingController();
  final TextEditingController l_Pr_GrandTotalController = TextEditingController();
  final TextEditingController l_Pr_l_Pr_OperationController = TextEditingController();

  Widget build(BuildContext context) {
    //For Sale TextFields

    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (l_VmSale.l_ModPcSale.l_PCSaleDetailsDBList.isNotEmpty) {
              DAL_PC().Fnc_Cud(l_VmSale.l_ModPcSale);
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.lightBlueAccent, // Set the background color of the button
          foregroundColor: Colors.black, // Set the color of the icon
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
                    child: Align(
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
                          controller: l_Pr_CustIDController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.lightBlueAccent,
                            hintText: 'Customer ID',
                            hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            // Adjust the floating label behavior
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.all(PrHeight * 0.007), // Adjust the vertical padding as needed
                          ),
                          validator: (value) {
                            l_VmSale.l_ModPcSale.Pr_CustID = value ?? '';
                            Tuple2<List<String>?, List<String>?> errors = DVMSalePC.Fnc_Validate(l_VmSale.l_ModPcSale);
                            if (errors.item2 != null && errors.item2!.contains('Pr_CustID')) {
                              return errors.item1![errors.item2!.indexOf('Pr_CustID')];
                            }
                            return null;
                          },
                          onChanged: (value) {
                            l_VmSale.Pr_txtCustID_Text = value;
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
                            controller: l_Pr_VoucherController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.lightBlueAccent,
                              hintText: 'Voucher',
                              hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.all(PrHeight * 0.007),
                            ),
                            validator: (value) {
                              l_VmSale.l_ModPcSale.Pr_Voucher = value ?? '';
                              Tuple2<List<String>?, List<String>?> errors = DVMSalePC.Fnc_Validate(l_VmSale.l_ModPcSale);
                              if (errors.item2 != null && errors.item2!.contains('Pr_Voucher')) {
                                return errors
                                    .item1![errors.item2!.indexOf('Pr_Voucher')]; // Return the error message for Pr_FullName
                              }

                              return null;
                            },
                            onChanged: (value) {
                              l_VmSale.Pr_txtVoucher_Text = value;
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
                                'Grand Total: ${l_VmSale.Pr_txtGrandTotal_Text.toString()}',
                                style: TextStyle(
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
                    child: SizedBox(
                      width: PrWidth * 0.225,
                      height: PrHeight * .045,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (G_MainValidationKey.currentState!.validate()) {
                              l_VmSale.FncFillModel();
                              if (l_VmSale.l_ModSaleDB != null) {
                                //DALSaleInfo().Fnc_CudSaleInfo(l_VmSale.l_ModSaleDB);
                                l_CustomAlertDialog.CustAlertDialog(
                                    context,
                                    PrHeight,
                                    PrWidth,
                                    G_DialogValidationKey,
                                    "Sale Details",
                                    ElevatedButton(
                                      child: Text(
                                        "Add",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      onPressed: () async {
                                        if (G_DialogValidationKey.currentState!.validate()) {
                                          l_VmSaleDetails.Pr_txtChildOperation_Text = 1;
                                          ModSaleDetailsDB lModSaleDetailsDB = l_VmSaleDetails.FncFillDetailsModel();
                                          if (lModSaleDetailsDB != null) {
                                            l_VmSale.FncFillPCModelList();
                                            //DALSaleDetails().Fnc_CudSaleDetails(l_VmSale.l_ModSaleDetailsDBList);
                                            //print(l_VmSaleDetails.l_ModPcSale.l_PCSaleDetailsDBList);
                                            l_VmSaleDetails.FncClearDialog(l_CustomAlertDialog);
                                          }
                                        } else {
                                          l_VmSaleDetails.l_TextFieldsValidation.value = true;
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.lightGreen,
                                        onPrimary: Colors.white,
                                        elevation: 7,
                                        // minimumSize: Size(150, 48),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    -1);
                              }
                            } else {
                              l_VmSale.l_TextFieldsValidation.value = true;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen,
                            onPrimary: Colors.white,
                            elevation: 7,
                            minimumSize: Size(150, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Insert',
                              style: TextStyle(fontSize: 15),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: PrHeight * 0.01,
                  ),
                  // Display the list builder here
                  Expanded(
                    child: Obx(() => ListView.builder(
                          shrinkWrap: true,
                          itemCount: l_VmSale.l_ModPcSale.l_PCSaleDetailsDBList.length,
                          itemBuilder: (context, l_ListIndex) {
                            final item = l_VmSale.l_ModPcSale.l_PCSaleDetailsDBList[l_ListIndex];
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
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            CustomAlertDialog l_UpdateCustomAlertDialog = CustomAlertDialog();
                                            l_UpdateCustomAlertDialog.CustAlertDialog(
                                                context,
                                                PrHeight,
                                                PrWidth,
                                                G_DialogValidationKey,
                                                "Update Data",
                                                ElevatedButton(
                                                  child: Text(
                                                    "Update",
                                                    style: TextStyle(fontSize: 15),
                                                  ),
                                                  onPressed: () async {
                                                    if (G_DialogValidationKey.currentState!.validate()) {
                                                      // Update the model
                                                      l_VmSaleDetails.Pr_txtChildOperation_Text = 2;
                                                      ModSaleDetailsDB lModSaleDetailsDB =
                                                          l_VmSaleDetails.FncFillDetailsModel();
                                                      if (lModSaleDetailsDB != null) {
                                                        l_VmSaleDetails.FncUpdateDetailsModel(lModSaleDetailsDB, l_UpdateCustomAlertDialog);
                                                        l_VmSale.FncUpdateList(l_ListIndex, lModSaleDetailsDB);


                                                        // Close the dialog
                                                        Navigator.of(context).pop();
                                                        l_VmSaleDetails.FncClearDialog(l_CustomAlertDialog);
                                                      }
                                                    } else {
                                                      l_VmSaleDetails.l_TextFieldsValidation.value = true;
                                                    }
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.lightGreen,
                                                    onPrimary: Colors.white,
                                                    elevation: 7,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                  ),
                                                ),
                                                l_ListIndex);
                                          },
                                        ),
                                        Text(
                                          'Sale Details',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        //DeleteButton
                                        IconButton(
                                          icon: Icon(Icons.delete, color: Colors.red),
                                          iconSize: 12.0,
                                          onPressed: () {
                                            // Get the item at the current index
                                            ModSaleDetailsDB item = l_VmSale.l_ModPcSale.l_PCSaleDetailsDBList[l_ListIndex];

                                            // Subtract the item total from the grand total
                                            l_VmSale.Pr_txtGrandTotal_Text -= item.Pr_ItemTotal!;

                                            // Remove the current item from the list
                                            l_VmSale.l_ModPcSale.l_PCSaleDetailsDBList.removeAt(l_ListIndex);
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
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Customer: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: l_VmSale.l_ModSaleDB.Pr_CustID.toString(),
                                                style: TextStyle(
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
                                              TextSpan(
                                                text: 'Item: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: item.Pr_Item.toString(),
                                                style: TextStyle(
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
                                              TextSpan(
                                                text: 'Quantity: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: item.Pr_Quantity.toString(),
                                                style: TextStyle(
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
                                              TextSpan(
                                                text: 'Rate: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: item.Pr_Rate.toString(),
                                                style: TextStyle(
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
                                              TextSpan(
                                                text: 'Total: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: item.Pr_ItemTotal.toString(),
                                                style: TextStyle(
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
