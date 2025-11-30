import 'package:app/week9/practice/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(expense.title), Text("\$${expense.amount}")],
          ),
          Spacer(),
          Icon(expense.category.icon),
          Text(
            "${expense.date.month}/${expense.date.day}/${expense.date.year}",
          ),
        ],
      ),
    );
  }
}
