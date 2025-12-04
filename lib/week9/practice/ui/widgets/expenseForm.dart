import 'package:flutter/material.dart';

class ExpenseForm extends StatelessWidget {
  const ExpenseForm({super.key});

  void onCloseModal(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(decoration: InputDecoration(label: Text("Title"))),
          TextField(decoration: InputDecoration(label: Text("Price"))),
          ElevatedButton(
            onPressed: () {
              onCloseModal(context);
            },
            child: Text("Close"),
          ),
        ],
      ),
    );
  }
}
