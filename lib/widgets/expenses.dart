import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses/expense_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  //entering dummy values for expense
  List<Expense> expenseList = [
    Expense(
        title: "Diapers",
        description: "Diaper for Travel",
        date: DateTime.now(),
        amount: 2000.0,
        category: Category.sanitary),
    Expense(
        title: "Milk",
        description: "Powdered Milk-Nestle",
        date: DateTime.now(),
        amount: 900.0,
        category: Category.food),
  ];
  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("This is a Chart"),
          const Text("This is a input mechenism"),
          ExpenseList(expenses: expenseList),
        ],
      ),
    );
  }
}
