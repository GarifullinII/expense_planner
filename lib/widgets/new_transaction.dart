import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function(String, double) newTransaction;

  NewTransaction({
    required this.newTransaction,
    super.key,
  });

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void addTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    newTransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 4, right: 4),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Title',
                fillColor: Colors.white,
              ),
              controller: titleController,
              onSubmitted: (_) => addTransaction(),
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
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => addTransaction(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: addTransaction,
              child: const Text('Add transaction'),
            ),
          )
        ],
      ),
    );
  }
}
