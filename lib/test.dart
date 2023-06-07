import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  final MyViewModel viewModel = Get.put(MyViewModel());
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM with GetX'),
      ),
      body: Column(
        children: [
          Obx(
                () => TextField(
              onChanged: (value) {
                viewModel.Pr_txtCustID_Text = value;
                moveCursorToEnd();
              },
              controller: TextEditingController(
                text: viewModel.Pr_txtCustID_Text,
              ),
              focusNode: _focusNode,
              autofocus: true, // Set autofocus to true
            ),
          ),
          ElevatedButton(
            onPressed: () => viewModel.clearTextField(),
            child: Text('Clear'),
          ),
        ],
      ),
    );
  }

  void moveCursorToEnd() {
    if (!_focusNode.hasFocus) {
      FocusScope.of(Get.context!).requestFocus(_focusNode);
    }
  }
}

class MyViewModel extends GetxController {
  RxString l_PrCustID = ''.obs;

  String get Pr_txtCustID_Text {
    return l_PrCustID.value;
  }

  set Pr_txtCustID_Text(String value) {
    l_PrCustID.value = value;
  }

  void clearTextField() {
    Pr_txtCustID_Text = '';
  }
}
