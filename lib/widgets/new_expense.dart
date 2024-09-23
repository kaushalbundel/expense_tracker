import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  // function to add expenses on the widget
  final Function onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

// creating a controller to store captured values(For label)
class _NewExpenseState extends State<NewExpense> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.cloths;
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
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

  // function to validate the modal information before saving the information
  void _selectedDataModal() {
    final amountModal = double.tryParse(_amountController.text);
    final numberValidation = amountModal != null && amountModal <= 0;
    if (_titleController.text.trim().isEmpty ||
        numberValidation ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Alert!"),
                content: const Text(
                    "Please enter the correct values for Title, Date and Amount"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Okay"))
                ],
              ));
      return;
    }
    // after the if statement, a statement to capture the validated expense value

    widget.onAddExpense(
      Expense(
          title: _titleController.text,
          description: _descriptionController.text,
          date: _selectedDate!,
          amount: amountModal!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
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
          Expanded(
            child: TextField(
              keyboardType: TextInputType.name,
              controller: _descriptionController,
              maxLines: 2,
              decoration: const InputDecoration(
                label: Text("Please enter the description"),
              ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Category"),
              const SizedBox(width: 16),
              DropdownButton<Category>(
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45),
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem<Category>(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (Category? value) {
                    if (value != null) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _selectedDataModal,
                child: const Text("Submit"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"))
            ],
          )
        ],
      ),
    );
  }
}
