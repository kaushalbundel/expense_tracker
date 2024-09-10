import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses/expense_list.dart';
import 'package:flutter/widgets.dart';

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

  //function to display model overlay so that user can add expense entries
  void _addExpenseModelOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            )); // there are other widgets that can be called by using "show" keywords
  }

//function to append items in the above expenseList list
  void _addExpense(Expense expense) {
    setState(() {
      expenseList.add(expense);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense Tracker",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: _addExpenseModelOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text("This is a Chart"),
          //const Text("This is a input mechenism"), //This is not needed as input mech is included in the app bar
          ExpenseList(expenses: expenseList),
        ],
      ),
    );
  }
}
