import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pccrud/MVVM/ViewModel/VmSale.dart';

import '../MVVM/Model/DB/ModSaleDetailsDB.dart';
import '../MVVM/ViewModel/VmSaleDetails.dart';
import 'customSnackBar.dart';

class CustomAlertDialog {
  final VmSaleDetails l_VmSaleDetails = Get.put(VmSaleDetails());




  void FncCustAlertDialog(BuildContext context, double PrHeight, PrWidth, GlobalKey<FormState> lValidationkey, String lTitle,
      int lSelectedindex, String l_BTNText) {
    //Fetching Data and extraxt on Widgets
    if (lSelectedindex >= 0 && lSelectedindex < l_VmSaleDetails. G_ListItemQuery.length) {
      l_VmSaleDetails.l_Pr_ItemController.text = l_VmSaleDetails. G_ListItemQuery[lSelectedindex].Pr_Item.toString();
      l_VmSaleDetails.l_Pr_QuantityController.text = l_VmSaleDetails. G_ListItemQuery[lSelectedindex].Pr_Quantity.toString();
      l_VmSaleDetails.l_Pr_RateController.text = l_VmSaleDetails. G_ListItemQuery[lSelectedindex].Pr_Rate.toString();
      l_VmSaleDetails.l_PrTotal.value=int.parse(l_VmSaleDetails. G_ListItemQuery[lSelectedindex].Pr_ItemTotal.toString());
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
                      controller: l_VmSaleDetails.l_Pr_ItemController,
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
                        l_VmSaleDetails.Pv_txtItem_Text = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.01),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: l_VmSaleDetails.l_Pr_QuantityController,
                      decoration: const InputDecoration(
                        labelText: 'Quantity',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Quantity';
                        }
                        final lRate = double.tryParse(value);
                        if (lRate == null || lRate == 0) {
                          return 'Quantity value cannot be zero';
                        }
                        if (lRate < 0) {
                          return 'Quantity value cannot be negative';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        int parsedValue = int.tryParse(value) ?? 0;
                        l_VmSaleDetails.Pv_txtQuantity_Text = parsedValue;
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: PrHeight * 0.01),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: l_VmSaleDetails.l_Pr_RateController,
                          decoration: const InputDecoration(
                            labelText: 'Rate',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Rate';
                            }
                            final lRate = double.tryParse(value);
                            if (lRate == null || lRate == 0) {
                              return 'Rate value cannot be zero';
                            }
                            if (lRate < 0) {
                              return 'Rate value cannot be negative';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            int parsedValue = int.tryParse(value) ?? 0;
                            l_VmSaleDetails.Pv_txtRate_Text = parsedValue;
                            if (parsedValue >= 0) {
                              if (l_VmSaleDetails.Pv_txtQuantity_Text == 0 || l_VmSaleDetails.Pv_txtRate_Text <= 0) {
                                l_VmSaleDetails.l_PrTotal.value = 0;
                              } else {
                                l_VmSaleDetails.FncFill_SaleDetailsModel();
                              }
                            }
                          })),

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
                          if (l_VmSaleDetails.Pv_txtQuantity_Text == 0 && l_VmSaleDetails.Pv_txtRate_Text == 0) {
                            return const Text(
                              '0',
                              style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w300,
                              ),
                            );
                          } else {
                            return Text(
                              l_VmSaleDetails.l_PrTotal.value.toString(),
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
                          l_VmSaleDetails.l_PrTotal.value = 0;
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(width: 8),
                      if (l_BTNText == 'Add')
                        ElevatedButton(
                          onPressed: () async {
                            CustomSnackBar lCustomsnackbar = CustomSnackBar();
                            l_VmSaleDetails.BTN_Add_Click();
                            lCustomsnackbar.FncCustSnackBAR("Alert", "Data Added", Colors.black);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.lightGreen,
                            elevation: 7,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            "$l_BTNText",
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                      else if (l_BTNText == 'Update')
                        ElevatedButton(
                          onPressed: () async {
                            CustomSnackBar lCustomsnackbar = CustomSnackBar();

                              l_VmSaleDetails.BTN_Update_Click(lSelectedindex);
                              lCustomsnackbar.FncCustSnackBAR(
                                  "Alert",
                                  "Data Updated",

                                  Colors.black);
                              // Close the dialog
                              Navigator.of(context).pop();
                              l_VmSaleDetails.FncClearDialog();

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
                        )
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
