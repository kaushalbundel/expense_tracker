import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expenseData});
  final Expense expenseData;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(categoryIcon[expenseData.category]),
                const SizedBox(
                  width: 8,
                ),
                Text(expenseData.category.name.toUpperCase()),
              ],
            ), //category is not shown properly in UI
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(expenseData.title),
                Text(expenseData.formattedDate),
                Text('\$${expenseData.amount.toStringAsFixed(1)}')
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(expenseData.description)
          ],
        ),
      ),
    );
  }
}
