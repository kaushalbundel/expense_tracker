import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

// creating a controller to store captured values(For label)
class _NewExpenseState extends State<NewExpense> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _pickedDate() async {
// logic of date shown on the date picker
    final DateTime currentDate = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: currentDate,
      lastDate: currentDate.add(
        const Duration(days: 365),
      ),
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.name,
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Expense Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    prefixText: "\$ ",
                    label: Text("Amount(\$)"),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (_selectedDate == null)
                        ? const Text("Select Date")
                        : Text(formatter.format(
                            _selectedDate!)), // "select date will be shown when no date is selected while showing the data on the contrary, a null check is added by addning !"
                    const SizedBox(
                      width: 2,
                    ),
                    IconButton(
                        onPressed: _pickedDate,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text("Submit"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              )
            ],
          )
        ],
      ),
    );
  }
}
