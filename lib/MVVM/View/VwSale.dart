import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDB.dart';
import 'package:pccrud/MVVM/Model/DB/ModSaleDetailsDB.dart';
import 'package:pccrud/Validation/DVMSale.dart';
import 'package:tuple/tuple.dart';

import '../../Validation/DVMSaleDetails.dart';
import '../../cmModule/DbHelper/DbHelperClass.dart';
import '../ViewModel/VmSale.dart';

class VwSale extends StatefulWidget {
  const VwSale({Key? key}) : super(key: key);

  @override
  State<VwSale> createState() => _VwSaleState();
}

class _VwSaleState extends State<VwSale> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VmSale l_VmSale = Get.put(VmSale());

  @override
  void initState() {
    // TODO: implement initState
    //DBHelper().FncCreateDataBase();
    DBHelper().FncCreateDataBase();
    super.initState();
  }

  //final DBHelper l_DBHelper = Get.put(DBHelper());
  ModSaleDB l_ModSaleDB = ModSaleDB();
  ModSaleDetailsDB l_ModSaleDetailsDB = ModSaleDetailsDB();

  //Controllers For Sale TextFields
  final TextEditingController l_Pr_CustIDController = TextEditingController();
  final TextEditingController l_Pr_VoucherController = TextEditingController();
  final TextEditingController l_Pr_GrandTotalController = TextEditingController();
  final TextEditingController l_Pr_l_Pr_OperationController = TextEditingController();

  //Controllers For SaleDetails TextFields
  final TextEditingController l_Pr_ItemController = TextEditingController();
  final TextEditingController l_Pr_QuantityController = TextEditingController();
  final TextEditingController l_Pr_RateController = TextEditingController();

  Widget build(BuildContext context) {
    //For Sale TextFields
    l_Pr_CustIDController.text = l_VmSale.Pr_txtCustID_Text;
    l_Pr_VoucherController.text = l_VmSale.Pr_txtVoucher_Text;
    l_Pr_GrandTotalController.text = l_VmSale.Pr_txtGrandTotal_Text;
    //For SaleDetails TextFields
    l_Pr_ItemController.text = l_VmSale.Pr_txtItem_Text;
    l_Pr_QuantityController.text = l_VmSale.Pr_txtQuantity_Text;

    // Add a function to show the dialog
    void _showSaleDetailsDialog(BuildContext context,double PrHeight, PrWidth) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bk.png"), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
              child: FractionallySizedBox(
                heightFactor: 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: PrHeight * 0.05),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Enter your sale details information",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: PrHeight * 0.01),
                          child: SizedBox(
                            width: PrWidth * .745,
                            child: TextFormField(
                              controller: l_Pr_ItemController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.lightBlueAccent,
                                hintText: 'Item',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                l_ModSaleDetailsDB.Pr_Item = value ?? '';
                                Tuple2<List<String>?, List<String>?> errors =
                                DVMSaleDetails.Fnc_Validate(l_ModSaleDetailsDB);
                                if (errors.item2 != null &&
                                    errors.item2!.contains('Pr_Item')) {
                                  return errors.item1![
                                  errors.item2!.indexOf('Pr_Item')];
                                }
                                return null;
                              },
                              onChanged: (value) {
                                l_VmSale.Pr_txtItem_Text = value;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: PrHeight * 0.01),
                          child: SizedBox(
                            width: PrWidth * .745,
                            child: TextFormField(
                              controller: l_Pr_QuantityController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.lightBlueAccent,
                                hintText: 'Quantity',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                l_ModSaleDetailsDB.Pr_Quantity = value ?? '';
                                Tuple2<List<String>?, List<String>?> errors =
                                DVMSaleDetails.Fnc_Validate(l_ModSaleDetailsDB);
                                if (errors.item2 != null &&
                                    errors.item2!.contains('Pr_Quantity')) {
                                  return errors.item1![
                                  errors.item2!.indexOf('Pr_Quantity')];
                                }
                                return null;
                              },
                              onChanged: (value) {
                                l_VmSale.Pr_txtQuantity_Text = value;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: PrHeight * 0.01),
                          child: SizedBox(
                            width: PrWidth * .745,
                            child: TextFormField(
                              controller: l_Pr_RateController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.lightBlueAccent,
                                hintText: 'Rate',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                int? parsedValue = int.tryParse(value ?? '');
                                l_ModSaleDetailsDB.Pr_Rate = parsedValue;

                                Tuple2<List<String>?, List<String>?> errors =
                                DVMSaleDetails.Fnc_Validate(l_ModSaleDetailsDB);
                                if (errors.item2 != null &&
                                    errors.item2!.contains('Pr_Rate')) {
                                  return errors.item1![
                                  errors.item2!.indexOf('Pr_Rate')];
                                }
                                return null;
                              },
                              onChanged: (value) {
                                int parsedValue = int.tryParse(value) ?? 0;
                                l_VmSale.Pr_txtRate_Text = parsedValue;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                  // Add your logic here
                  Navigator.pop(context);
                },
                child: Text('Button'),
              ),
            ],
          );
        },
      );
    }


    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () async {


              },
              child: Icon(Icons.save),
              backgroundColor: Colors.lightBlueAccent, // Set the background color of the button
              foregroundColor: Colors.black, // Set the color of the icon
            ),
            FloatingActionButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  l_VmSale.FncFillModel();
                  if (l_VmSale.l_ModSaleDB != null) {
                    _showSaleDetailsDialog(context,PrHeight,PrWidth);

                    l_Pr_CustIDController.clear();
                    l_Pr_GrandTotalController.clear();
                    l_Pr_VoucherController.clear();
                    l_Pr_l_Pr_OperationController.clear();
                  }
                } else {
                  l_VmSale.l_TextFieldsValidation.value = true;
                }
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.lightBlueAccent, // Set the background color of the button
              foregroundColor: Colors.black, // Set the color of the icon
            ),

          ],
        ),
        body: Form(
          key: _formKey,
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
                    top: PrHeight * 0.06,
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
                Padding(
                  padding: EdgeInsets.only(
                    top: PrHeight * 0.01,
                  ),
                  child: SizedBox(
                    width: PrWidth * .745,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: l_Pr_l_Pr_OperationController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.lightBlueAccent,
                        hintText: 'Operation',
                        hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                      ),
                      validator: (value) {
                        int? parsedValue = int.tryParse(value ?? '');
                        l_ModSaleDB.Pr_Operation = parsedValue;

                        Tuple2<List<String>?, List<String>?> errors = DVMSale.Fnc_Validate(l_ModSaleDB);
                        if (errors.item2 != null && errors.item2!.contains('Pr_Operation')) {
                          return errors
                              .item1![errors.item2!.indexOf('Pr_Operation')]; // Return the error message for Pr_EmailID
                        }

                        return null;
                      },
                      onChanged: (value) {
                        int parsedValue = int.tryParse(value) ?? 0;
                        l_VmSale.Pr_txtOperation_Text = parsedValue;
                      },
                    ),
                  ),
                ),
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
                        hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                      ),
                      validator: (value) {
                        l_ModSaleDB.Pr_CustID = value ?? '';
                        Tuple2<List<String>?, List<String>?> errors = DVMSale.Fnc_Validate(l_ModSaleDB);
                        if (errors.item2 != null && errors.item2!.contains('Pr_CustID')) {
                          return errors.item1![errors.item2!.indexOf('Pr_CustID')];
                        }

                        return null;
                      },
                      onChanged: (value) {
                        l_VmSale.Pr_txtCustID_Text = value;
                      },
                    ),
                  ),
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
                            hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                          ),
                          validator: (value) {
                            l_ModSaleDB.Pr_Voucher = value ?? '';
                            Tuple2<List<String>?, List<String>?> errors = DVMSale.Fnc_Validate(l_ModSaleDB);
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
                      child: TextFormField(
                          controller: l_Pr_GrandTotalController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.lightBlueAccent,
                            hintText: 'Grand Total',
                            hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                          ),
                          validator: (value) {
                            l_ModSaleDB.Pr_GrandTotal = value ?? '';
                            Tuple2<List<String>?, List<String>?> errors = DVMSale.Fnc_Validate(l_ModSaleDB);
                            if (errors.item2 != null && errors.item2!.contains('Pr_GrandTotal')) {
                              return errors
                                  .item1![errors.item2!.indexOf('Pr_GrandTotal')]; // Return the error message for Pr_EmailID
                            }

                            return null;
                          },
                          onChanged: (value) {
                            l_VmSale.Pr_txtGrandTotal_Text = value;
                          })),
                ),
                SizedBox(
                  height: PrHeight * 0.01,
                ),

                // Display the list builder here
                Expanded(
                  child: Obx(() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: l_VmSale.l_ModSaleDetailsDBList.length,
                        itemBuilder: (context, index) {
                          final item = l_VmSale.l_ModSaleDetailsDBList[index];
                          return Card(
                            color: Colors.cyan,
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      'Sale Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Item: ${item.Pr_Item.toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'VmDID: ${item.Pr_VmDID.toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  // Add more fields from the ModSaleDetailsDB model as needed
                                ],
                              ),
                            ),
                          );

                        },
                      )),
                ),
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
