import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses/expense_card.dart';

// class used for  creating the list view of expenses
class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  // on dismissed function as an value
  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;
  @override
  Widget build(context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, item) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.6),
          ),
          onDismissed: (direction) {
            onRemoveExpense(expenses[item]);
          },
          key: ValueKey(expenses[item]),
          child: ExpenseCard(
            expenseData: expenses[item],
          ),
        ), //dismissable widget is used so that the individual list item can be dismissed by swiping.
      ),
    );
  }
}
