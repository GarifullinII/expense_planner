import 'package:expense_planner/widgets/platform_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double, DateTime) newTransaction;

  const NewTransaction({
    required this.newTransaction,
    super.key,
  });

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  void _addTransaction() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    final enteredDate = _selectedDate;

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.newTransaction(enteredTitle, enteredAmount, enteredDate);

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10,
          top: 10,
          right: 10,
          bottom: mediaQuery.viewInsets.bottom + 10,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4, top: 8, right: 4),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Title',
                        fillColor: Theme.of(context).primaryColor,
                      ),
                      controller: _titleController,
                      onSubmitted: (_) => _addTransaction(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, top: 8, right: 4),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Amount',
                      ),
                      controller: _amountController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) => _addTransaction(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Picked Date: ${DateFormat.yMd().format(_selectedDate)} ',
                          ),
                        ),
                        TextButton(
                            onPressed: presentDatePicker,
                            child: const Text('Choose date')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: PlatformButton(
                      handler: () => _addTransaction,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
