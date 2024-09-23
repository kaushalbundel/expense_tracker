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
        isScrollControlled: true, // to display the modal on the complete screen
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            )); // there are other widgets that can be called by using "show" keywords
  }

//function to append items in the above expenseList list <setstate is called as the stored expense will be displayed on the screen after saving>
  void _addExpense(Expense expense) {
    setState(() {
      expenseList.add(expense);
    });
  }

  //function to delete items in the expenseList once they have been dismissed

  void _deleteExpense(Expense expense) {
    final positionInExpenseList = expenseList.indexOf(expense);
    setState(() {
      expenseList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: const Text("The item is deleted"),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              expenseList.insert(positionInExpenseList, expense);
            }); //setState is added so that as the undo button is clicked the expense item is added in the list again and the widget gets rebuilt
          }),
    ));
  }

  @override
  Widget build(context) {
    Widget mainContent =
        const Center(child: Text("Please add expense to show!"));
    if (expenseList.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: expenseList,
        onRemoveExpense: _deleteExpense,
      );
    }
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
          mainContent,
        ],
      ),
    );
  }
}
