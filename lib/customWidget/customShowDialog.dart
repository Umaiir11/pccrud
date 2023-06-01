import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../MVVM/Model/DB/ModSaleDetailsDB.dart';
import '../MVVM/ViewModel/VmSaleDetails.dart';
import '../Validation/DVMSaleDetails.dart';

class CustomAlertDialog {
  final VmSaleDetails l_VmSaleDetails = Get.put(VmSaleDetails());
  ModSaleDetailsDB l_ModSaleDetailsDB = ModSaleDetailsDB();

  final TextEditingController l_Pr_ItemController = TextEditingController();
  final TextEditingController l_Pr_QuantityController = TextEditingController();
  final TextEditingController l_Pr_RateController = TextEditingController();

  void CustAlertDialog(BuildContext context, String submitButtonText, double PrHeight, PrWidth, GlobalKey<FormState> key)
  {
    l_Pr_ItemController.text = l_VmSaleDetails.Pr_txtItem_Text;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return GestureDetector(
          onTap: () {
            // Dismiss the keyboard
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: AlertDialog(title: Text(
            'Sale Details',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
          ),
            insetPadding: EdgeInsets.zero,
            content:Form(
              key: key,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [


                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.01),
                    child: TextFormField(
                      controller: l_Pr_ItemController,
                      decoration: InputDecoration(
                        labelText: 'Item',
                      ),
                      validator: (value) {
                        l_ModSaleDetailsDB.Pr_Item = value ?? '';
                        Tuple2<List<String>?, List<String>?> errors = DVMSaleDetails.Fnc_Validate(l_ModSaleDetailsDB);
                        if (errors.item2 != null && errors.item2!.contains('Pr_Item')) {
                          return errors.item1![errors.item2!.indexOf('Pr_Item')];
                        }

                        return null;
                      },
                      onChanged: (value) {
                        l_VmSaleDetails.Pr_txtItem_Text = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.01),
                    child: TextFormField(
                      controller: l_Pr_QuantityController,
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                      ),
                      validator: (value) {
                        int? parsedValue = int.tryParse(value ?? '');
                        l_ModSaleDetailsDB.Pr_Quantity = parsedValue;
                        Tuple2<List<String>?, List<String>?> errors = DVMSaleDetails.Fnc_Validate(l_ModSaleDetailsDB);
                        if (errors.item2 != null && errors.item2!.contains('Pr_Quantity')) {
                          return errors.item1![errors.item2!.indexOf('Pr_Quantity')];
                        }

                        return null;
                      },
                      onChanged: (value) {
                        int parsedValue = int.tryParse(value) ?? 0;
                        l_VmSaleDetails.Pr_txtQuantity_Text = parsedValue;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.01),
                    child: TextFormField(
                      controller: l_Pr_RateController,
                      decoration: InputDecoration(
                        labelText: 'Rate',
                      ),
                      validator: (value) {
                        int? parsedValue = int.tryParse(value ?? '');
                        l_ModSaleDetailsDB.Pr_Rate = parsedValue;

                        Tuple2<List<String>?, List<String>?> errors = DVMSaleDetails.Fnc_Validate(l_ModSaleDetailsDB);
                        if (errors.item2 != null && errors.item2!.contains('Pr_Rate')) {
                          return errors.item1![errors.item2!.indexOf('Pr_Rate')]; // Return the error message for Pr_EmailID
                        }
                        return null;
                      },
                      onChanged: (value) {
                        //l_VmSaleDetails.   FncItemtotal();;
                        int parsedValue = int.tryParse(value) ?? 0;
                        l_VmSaleDetails.Pr_txtRate_Text = parsedValue;
                        // Call the function here
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                        ),
                        Obx(() {
                          if (l_VmSaleDetails.Pr_txtQuantity_Text == 0 && l_VmSaleDetails.Pr_txtRate_Text == 0) {
                            return Text(
                              '0',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            );
                          } else {
                            return Text(
                              '${l_VmSaleDetails.Pr_txtTotal_Text.toString()}',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: PrHeight*.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(
                          'Close',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        child: Text(
                          submitButtonText,
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () async {
                          if (key.currentState!.validate()) {
                            l_VmSaleDetails.FncFillDetailsModel();
                            if (l_VmSaleDetails.l_ModSaleDetailsDB != null) {
                              //DALSaleDetails().Fnc_CudSaleDetails(l_VmSale.l_ModSaleDetailsDBList);
                              //print(l_VmSaleDetails.l_ModPcSale.l_PCSaleDetailsDBList);
                              l_Pr_QuantityController.clear();
                              l_Pr_ItemController.clear();
                              l_Pr_RateController.clear();
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
          child: child,
        );
      },

    );
  }
}