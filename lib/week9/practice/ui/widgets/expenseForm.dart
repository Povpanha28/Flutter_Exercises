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
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  bool _isInputValid(String title, double? amount, DateTime? date) {
    if (title.isEmpty) {
      showWarningDialog("Invalid input", "The title cannot be empty.");
      return false;
    }

    if (amount == null || amount <= 0) {
      showWarningDialog(
        "Invalid input",
        "The amount must be greater than zero.",
      );
      return false;
    }

    if (date == null) {
      showWarningDialog("Invalid input", "Please select a date.");
      return false;
    }

    return true;
  }

  void _submit() {
    final title = _titleController.text.trim();
    final amount = double.tryParse(_amountController.text);

    if (!_isInputValid(title, amount, _selectedDate)) return;

    final expense = Expense(
      title: title,
      amount: amount!,
      date: _selectedDate!,
      category: selectedCategory,
    );

    widget.onAddExpense(expense);
    Navigator.pop(context);
  }

  void showWarningDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Okay"),
          ),
        ],
      ),
    );
  }

  void _presentDatePicker() async {
    final now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void onCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Title"),
            maxLength: 50,
          ),

          TextField(
            controller: _amountController,
            decoration: const InputDecoration(labelText: "Amount"),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
          ),

          const SizedBox(height: 16),

          DropdownButtonFormField<ExpenseType>(
            value: selectedCategory,
            items: ExpenseType.values
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name.toUpperCase()),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
            },
            decoration: const InputDecoration(labelText: "Category"),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: Text(
                  _selectedDate == null
                      ? "No date selected"
                      : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                  style: TextStyle(
                    color: _selectedDate == null
                        ? Colors.grey
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_month),
                onPressed: _presentDatePicker,
              ),
            ],
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: onCancel, child: const Text("Cancel")),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
