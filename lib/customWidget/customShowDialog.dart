import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/ViewModel/VmSale.dart';

import '../MVVM/Model/DB/ModSaleDetailsDB.dart';
import '../MVVM/ViewModel/VmSaleDetails.dart';

class CustomAlertDialog {
  final VmSaleDetails l_VmSaleDetails = Get.put(VmSaleDetails());
  final VmSale l_VmSale = Get.put(VmSale());
  ModSaleDetails l_ModSaleDetailsDB = ModSaleDetails();

  final TextEditingController l_Pr_ItemController = TextEditingController();
  final TextEditingController l_Pr_QuantityController = TextEditingController();
  final TextEditingController l_Pr_RateController = TextEditingController();

  void FncCustAlertDialog(BuildContext context, double PrHeight, PrWidth, GlobalKey<FormState> lValidationkey, String lTitle,
      ElevatedButton lAddbutton, int lSelectedindex) {
    //Fetching Data and extraxt on Widgets
    if (lSelectedindex >= 0 && lSelectedindex < l_VmSale.l_ModPcSale.l_PCSaleDetailsDBList.length) {
      l_Pr_ItemController.text = l_VmSale.l_ModPcSale.l_PCSaleDetailsDBList[lSelectedindex].Pr_Item.toString();
      l_Pr_QuantityController.text = l_VmSale.l_ModPcSale.l_PCSaleDetailsDBList[lSelectedindex].Pr_Quantity.toString();
      l_Pr_RateController.text = l_VmSale.l_ModPcSale.l_PCSaleDetailsDBList[lSelectedindex].Pr_Rate.toString();
      l_VmSaleDetails.Pr_txtTotal_Text =
          int.parse(l_VmSale.l_ModPcSale.l_PCSaleDetailsDBList[lSelectedindex].Pr_ItemTotal.toString());
    }

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return GestureDetector(
          onTap: () {
            // Dismiss the keyboard
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: AlertDialog(
            title: Text(
              lTitle,
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
            ),
            insetPadding: EdgeInsets.zero,
            content: Form(
              key: lValidationkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //TextWidgets
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.01),
                    child: TextFormField(
                      controller: l_Pr_ItemController,
                      decoration: const InputDecoration(
                        labelText: 'Item',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Item';
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
                      keyboardType: TextInputType.number,
                      controller: l_Pr_QuantityController,
                      decoration: const InputDecoration(
                        labelText: 'Quantity',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Quantity';
                        }
                        final l_Rate = double.tryParse(value);
                        if (l_Rate == null || l_Rate == 0) {
                          return 'Quantity value cannot be zero';
                        }
                        if (l_Rate < 0) {
                          return 'Quantity value cannot be negative';
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
                      keyboardType: TextInputType.number,
                      controller: l_Pr_RateController,
                      decoration: const InputDecoration(
                        labelText: 'Rate',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Rate';
                        }
                        final l_Rate = double.tryParse(value);
                        if (l_Rate == null || l_Rate == 0) {
                          return 'Rate value cannot be zero';
                        }
                        if (l_Rate < 0) {
                          return 'Rate value cannot be negative';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        int parsedValue = int.tryParse(value) ?? 0;
                        l_VmSaleDetails.Pr_txtRate_Text = parsedValue;
                        //Call FncFill_SaleDetailsModel here.
                        if (l_VmSaleDetails.Pr_txtItem_Text.isNotEmpty &&
                            l_VmSaleDetails.Pr_txtQuantity_Text != 0 &&
                            parsedValue != 0) {
                          ModSaleDetails lModSaleDetails = l_VmSaleDetails.FncFill_SaleDetailsModel();
                          l_VmSaleDetails.FncSet_SalesDetailsModelData(lModSaleDetails);
                        }
                      },
                    ),
                  ),

                  //Conatiner to add Show Data
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Total: ',
                          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                        ),
                        Obx(() {
                          if (l_VmSaleDetails.Pr_txtQuantity_Text == 0 && l_VmSaleDetails.Pr_txtRate_Text == 0) {
                            return const Text(
                              '0',
                              style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w300,
                              ),
                            );
                          } else {
                            return Text(
                              l_VmSaleDetails.Pr_txtTotal_Text.toString(),
                              style: const TextStyle(color: Colors.black38, fontWeight: FontWeight.w300, fontSize: 18),
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: PrHeight * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text(
                          'Close',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(width: 8),
                      lAddbutton,
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder:
          (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
          child: child,
        );
      },
    );
  }
}
