import 'package:uuid/uuid.dart';

var uuid = Uuid();

enum ExpenseType { food, travel, leisure, work }

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  Expense(this.amount, this.date, this.id, this.title, this.category);
}
