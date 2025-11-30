import 'package:app/week9/practice/model/expense.dart';
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
    Expense(20.5, DateTime.now(), "Lunch", ExpenseType.food),
    Expense(
      12.0,
      DateTime.now().subtract(Duration(days: 1)),
      "Breakfast",
      ExpenseType.food,
    ),
    Expense(
      35.75,
      DateTime.now().subtract(Duration(days: 2)),
      "Dinner with friends",
      ExpenseType.food,
    ),

    Expense(
      150.0,
      DateTime.now().subtract(Duration(days: 3)),
      "Flight ticket",
      ExpenseType.travel,
    ),
    Expense(
      8.25,
      DateTime.now().subtract(Duration(days: 4)),
      "Bus fare",
      ExpenseType.travel,
    ),
    Expense(
      60.0,
      DateTime.now().subtract(Duration(days: 5)),
      "Taxi to airport",
      ExpenseType.travel,
    ),

    Expense(
      25.0,
      DateTime.now().subtract(Duration(days: 6)),
      "Movie night",
      ExpenseType.leisure,
    ),
    Expense(
      9.5,
      DateTime.now().subtract(Duration(days: 7)),
      "Ice cream at park",
      ExpenseType.leisure,
    ),
    Expense(
      45.0,
      DateTime.now().subtract(Duration(days: 8)),
      "Theme park tickets",
      ExpenseType.leisure,
    ),

    Expense(
      120.0,
      DateTime.now().subtract(Duration(days: 9)),
      "Office supplies",
      ExpenseType.work,
    ),
    Expense(
      15.0,
      DateTime.now().subtract(Duration(days: 10)),
      "Morning coffee at work",
      ExpenseType.work,
    ),
    Expense(
      75.0,
      DateTime.now().subtract(Duration(days: 11)),
      "Work lunch with team",
      ExpenseType.work,
    ),
    Expense(
      18.0,
      DateTime.now().subtract(Duration(days: 12)),
      "Noodles",
      ExpenseType.food,
    ),
    Expense(
      6.75,
      DateTime.now().subtract(Duration(days: 13)),
      "Iced Latte",
      ExpenseType.food,
    ),
    Expense(
      42.5,
      DateTime.now().subtract(Duration(days: 14)),
      "Family dinner",
      ExpenseType.food,
    ),
    Expense(
      3.25,
      DateTime.now().subtract(Duration(days: 15)),
      "Banana snack",
      ExpenseType.food,
    ),
    Expense(
      11.0,
      DateTime.now().subtract(Duration(days: 16)),
      "Boba tea",
      ExpenseType.food,
    ),

    Expense(
      32.0,
      DateTime.now().subtract(Duration(days: 17)),
      "Grab to work",
      ExpenseType.travel,
    ),
    Expense(
      98.0,
      DateTime.now().subtract(Duration(days: 18)),
      "Taxi long distance",
      ExpenseType.travel,
    ),
    Expense(
      12.0,
      DateTime.now().subtract(Duration(days: 19)),
      "Train ticket",
      ExpenseType.travel,
    ),
    Expense(
      4.0,
      DateTime.now().subtract(Duration(days: 20)),
      "Bike rental",
      ExpenseType.travel,
    ),
    Expense(
      175.5,
      DateTime.now().subtract(Duration(days: 21)),
      "Weekend trip bus ticket",
      ExpenseType.travel,
    ),

    Expense(
      13.5,
      DateTime.now().subtract(Duration(days: 22)),
      "Popcorn & Coke",
      ExpenseType.leisure,
    ),
    Expense(
      27.0,
      DateTime.now().subtract(Duration(days: 23)),
      "Bowling game",
      ExpenseType.leisure,
    ),
    Expense(
      55.0,
      DateTime.now().subtract(Duration(days: 24)),
      "Concert ticket",
      ExpenseType.leisure,
    ),
    Expense(
      10.0,
      DateTime.now().subtract(Duration(days: 25)),
      "Netflix monthly",
      ExpenseType.leisure,
    ),
    Expense(
      39.9,
      DateTime.now().subtract(Duration(days: 26)),
      "Mini golf",
      ExpenseType.leisure,
    ),

    Expense(
      210.0,
      DateTime.now().subtract(Duration(days: 27)),
      "Office chair",
      ExpenseType.work,
    ),
    Expense(
      12.0,
      DateTime.now().subtract(Duration(days: 28)),
      "Print docs",
      ExpenseType.work,
    ),
    Expense(
      38.25,
      DateTime.now().subtract(Duration(days: 29)),
      "Stationery refill",
      ExpenseType.work,
    ),
    Expense(
      14.0,
      DateTime.now().subtract(Duration(days: 30)),
      "Workplace coffee",
      ExpenseType.work,
    ),
    Expense(
      350.0,
      DateTime.now().subtract(Duration(days: 31)),
      "New monitor",
      ExpenseType.work,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense App"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.blue[200],
        child: ListView.builder(
          itemCount: registeredExpenses.length,
          itemBuilder: (context, index) => _buildItem(context, index, registeredExpenses),
        ),
        // child: Column(children: [ExpenseCard(expense: expense)]),
      ),
    );
  }
}

Widget _buildItem(BuildContext context, int index, List<Expense> expenses) {
  print("Build item $index");

  return ExpenseCard(expense: expenses[index]);
}
