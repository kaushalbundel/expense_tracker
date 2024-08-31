import 'package:flutter/material.dart';

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
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
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
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: const InputDecoration(
              prefixText: "\$ ",
              label: Text("Amount(\$)"),
            ),
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
