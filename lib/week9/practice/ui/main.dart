import 'package:app/week9/practice/model/expense.dart';
import 'package:app/week9/practice/ui/widgets/ExpenseForm.dart';
import 'package:app/week9/practice/ui/widgets/expenseItem.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Expenses()));
}

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<Expense> registeredExpenses = [
    Expense(
      amount: 20.5,
      date: DateTime.now(),
      title: "Lunch",
      category: ExpenseType.food,
    ),

    Expense(
      amount: 12.0,
      date: DateTime.now().subtract(Duration(days: 1)),
      title: "Breakfast",
      category: ExpenseType.food,
    ),

    Expense(
      amount: 35.75,
      date: DateTime.now().subtract(Duration(days: 2)),
      title: "Dinner with friends",
      category: ExpenseType.food,
    ),

    Expense(
      amount: 150.0,
      date: DateTime.now().subtract(Duration(days: 3)),
      title: "Flight ticket",
      category: ExpenseType.travel,
    ),
    // Expense(
    //   amount: 8.25,
    //   date: DateTime.now().subtract(Duration(days: 4)),
    //   title: "Bus fare",
    //   category: ExpenseType.travel,
    // ),
    // Expense(
    //   amount: 60.0,
    //   date: DateTime.now().subtract(Duration(days: 5)),
    //   title: "Taxi to airport",
    //   category: ExpenseType.travel,
    // ),

    // Expense(
    //   amount: 25.0,
    //   date: DateTime.now().subtract(Duration(days: 6)),
    //   title: "Movie night",
    //   category: ExpenseType.leisure,
    // ),
    // Expense(
    //   amount: 9.5,
    //   date: DateTime.now().subtract(Duration(days: 7)),
    //   title: "Ice cream at park",
    //   category: ExpenseType.leisure,
    // ),
    // Expense(
    //   amount: 45.0,
    //   date: DateTime.now().subtract(Duration(days: 8)),
    //   title: "Theme park tickets",
    //   category: ExpenseType.leisure,
    // ),

    // Expense(
    //   amount: 120.0,
    //   date: DateTime.now().subtract(Duration(days: 9)),
    //   title: "Office supplies",
    //   category: ExpenseType.work,
    // ),
    // Expense(
    //   amount: 15.0,
    //   date: DateTime.now().subtract(Duration(days: 10)),
    //   title: "Morning coffee at work",
    //   category: ExpenseType.work,
    // ),
    // Expense(
    //   amount: 75.0,
    //   date: DateTime.now().subtract(Duration(days: 11)),
    //   title: "Work lunch with team",
    //   category: ExpenseType.work,
    // ),

    // Expense(
    //   amount: 18.0,
    //   date: DateTime.now().subtract(Duration(days: 12)),
    //   title: "Noodles",
    //   category: ExpenseType.food,
    // ),
    // Expense(
    //   amount: 6.75,
    //   date: DateTime.now().subtract(Duration(days: 13)),
    //   title: "Iced Latte",
    //   category: ExpenseType.food,
    // ),
    // Expense(
    //   amount: 42.5,
    //   date: DateTime.now().subtract(Duration(days: 14)),
    //   title: "Family dinner",
    //   category: ExpenseType.food,
    // ),
    // Expense(
    //   amount: 3.25,
    //   date: DateTime.now().subtract(Duration(days: 15)),
    //   title: "Banana snack",
    //   category: ExpenseType.food,
    // ),
    // Expense(
    //   amount: 11.0,
    //   date: DateTime.now().subtract(Duration(days: 16)),
    //   title: "Boba tea",
    //   category: ExpenseType.food,
    // ),

    // Expense(
    //   amount: 32.0,
    //   date: DateTime.now().subtract(Duration(days: 17)),
    //   title: "Grab to work",
    //   category: ExpenseType.travel,
    // ),
    // Expense(
    //   amount: 98.0,
    //   date: DateTime.now().subtract(Duration(days: 18)),
    //   title: "Taxi long distance",
    //   category: ExpenseType.travel,
    // ),
    // Expense(
    //   amount: 12.0,
    //   date: DateTime.now().subtract(Duration(days: 19)),
    //   title: "Train ticket",
    //   category: ExpenseType.travel,
    // ),
    // Expense(
    //   amount: 4.0,
    //   date: DateTime.now().subtract(Duration(days: 20)),
    //   title: "Bike rental",
    //   category: ExpenseType.travel,
    // ),
    // Expense(
    //   amount: 175.5,
    //   date: DateTime.now().subtract(Duration(days: 21)),
    //   title: "Weekend trip bus ticket",
    //   category: ExpenseType.travel,
    // ),

    // Expense(
    //   amount: 13.5,
    //   date: DateTime.now().subtract(Duration(days: 22)),
    //   title: "Popcorn & Coke",
    //   category: ExpenseType.leisure,
    // ),
    // Expense(
    //   amount: 27.0,
    //   date: DateTime.now().subtract(Duration(days: 23)),
    //   title: "Bowling game",
    //   category: ExpenseType.leisure,
    // ),
    // Expense(
    //   amount: 55.0,
    //   date: DateTime.now().subtract(Duration(days: 24)),
    //   title: "Concert ticket",
    //   category: ExpenseType.leisure,
    // ),
    // Expense(
    //   amount: 10.0,
    //   date: DateTime.now().subtract(Duration(days: 25)),
    //   title: "Netflix monthly",
    //   category: ExpenseType.leisure,
    // ),
    // Expense(
    //   amount: 39.9,
    //   date: DateTime.now().subtract(Duration(days: 26)),
    //   title: "Mini golf",
    //   category: ExpenseType.leisure,
    // ),

    // Expense(
    //   amount: 210.0,
    //   date: DateTime.now().subtract(Duration(days: 27)),
    //   title: "Office chair",
    //   category: ExpenseType.work,
    // ),
    // Expense(
    //   amount: 12.0,
    //   date: DateTime.now().subtract(Duration(days: 28)),
    //   title: "Print docs",
    //   category: ExpenseType.work,
    // ),
    // Expense(
    //   amount: 38.25,
    //   date: DateTime.now().subtract(Duration(days: 29)),
    //   title: "Stationery refill",
    //   category: ExpenseType.work,
    // ),
    // Expense(
    //   amount: 14.0,
    //   date: DateTime.now().subtract(Duration(days: 30)),
    //   title: "Workplace coffee",
    //   category: ExpenseType.work,
    // ),
    // Expense(
    //   amount: 350.0,
    //   date: DateTime.now().subtract(Duration(days: 31)),
    //   title: "New monitor",
    //   category: ExpenseType.work,
    // ),
  ];

  // Function that child will call
  void _addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void onShowModal() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ExpenseForm(onAddExpense: _addExpense);
      },
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final expense = registeredExpenses[index]; // Capture it first
    final removeIndex = index;

    return Dismissible(
      key: ValueKey(expense.id),
      child: ExpenseCard(expense: expense),
      onDismissed: (_) {
        setState(() {
          registeredExpenses.remove(expense); // Remove by object, not index
        });

        // Offer undo after removal
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text('${expense.title} deleted'),
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: () {
                  setState(() {
                    // final insertIndex = removeIndex.clamp(
                    //   0,
                    //   registeredExpenses.length,
                    // );
                    registeredExpenses.insert(removeIndex, expense);
                  });
                },
              ),
            ),
          );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text("Expense App"),
        actions: [IconButton(onPressed: onShowModal, icon: Icon(Icons.add))],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.blue[200],
        child: registeredExpenses.isEmpty
            ? const Center(child: Text("No expense added yet"))
            : ListView.builder(
                itemCount: registeredExpenses.length,
                itemBuilder: (context, index) => _buildItem(context, index),
              ),
      ),
    );
  }
}
