import 'package:flutter/material.dart';



class MyHomePage extends StatelessWidget {
  final ViewModel viewModel;

  MyHomePage({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two-Way Data Binding Demo'),
      ),
      body: Column(
        children: [
          TextField(
            controller: viewModel.textController,
            decoration: InputDecoration(
              hintText: 'Enter text',
            ),
          ),
          ElevatedButton(
            onPressed: viewModel.clearTextField,
            child: Text('Clear'),
          ),
        ],
      ),
    );
  }
}

class ViewModel {
  TextEditingController textController = TextEditingController();

  void clearTextField() {
    textController.text = '';
  }


}
