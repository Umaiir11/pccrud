import 'package:flutter/material.dart';

class CustomAlertDialog {
  static void CustAlertDialog(BuildContext context, String submitButtonText, double PrHeight, PrWidth) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/cal.jpg"), fit: BoxFit.cover),
            ),
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Field 1',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Field 2',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Field 3',
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        child: Text(submitButtonText),
                        onPressed: () {
                          // Perform submit logic
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
