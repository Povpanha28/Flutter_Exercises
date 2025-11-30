import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

enum ExpenseType {
  food(Icons.fastfood),
  travel(Icons.flight),
  leisure(Icons.movie),
  work(Icons.work);

  final IconData icon;

  const ExpenseType(this.icon);
}

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  Expense(this.amount, this.date, this.title, this.category) : id = uuid.v4();
}
