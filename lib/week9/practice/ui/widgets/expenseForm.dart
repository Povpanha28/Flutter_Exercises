import 'package:app/week9/practice/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseForm extends StatefulWidget {
  final void Function(Expense) onAddExpense;
  const ExpenseForm({super.key, required this.onAddExpense});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  ExpenseType selectedCategory = ExpenseType.food;

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
    _amountController.dispose();
  }

void _submit() {
  String title = _titleController.text.trim();
  double? amount = double.tryParse(_amountController.text);

  if (title.isEmpty) {
    showWarningDialog("Invalid input", "The title cannot be empty");
    return;
  }

  if (amount == null) {
    showWarningDialog(
      "Invalid input",
      "The amount can't be empty !",
    );
    return;
  }

  // Create expense only after validation
  Expense expense = Expense(
    amount: amount,
    date: DateTime.now(),
    title: title,
    category: selectedCategory,
  );

  widget.onAddExpense(expense);   // send to parent
}

  void showWarningDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text("Okay")),
        ],
      ),
    );
  }

  void onCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          TextField(
            decoration: InputDecoration(label: Text("Amount")),
            controller: _amountController,
            keyboardType: TextInputType.number, // Shows the number keyboard
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
          ),
          SizedBox(height: 20),
          DropdownButton(
            menuWidth: 500,
            value: selectedCategory,
            items: ExpenseType.values
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name.toUpperCase()),
                  ),
                )
                .toList(),
            onChanged: (expenseType) {
              setState(() {
                selectedCategory = expenseType!;
              });
            },
          ),
          Row(
            children: [
              ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
              SizedBox(width: 10),
              ElevatedButton(onPressed: () => _submit(), child: Text("Create")),
            ],
          ),
        ],
      ),
    );
  }
}
