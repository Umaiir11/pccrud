import 'package:flutter/material.dart';



class MyHomePage extends StatelessWidget {
  final ViewModel viewModel;

  const MyHomePage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two-Way Data Binding Demo'),
      ),
      body: Column(
        children: [
          TextField(
            controller: viewModel.textController,
            decoration: const InputDecoration(
              hintText: 'Enter text',
            ),
          ),
          ElevatedButton(
            onPressed: viewModel.clearTextField,
            child: const Text('Clear'),
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
