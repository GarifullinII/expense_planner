import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function(String, double) newTransaction;

  NewTransaction({
    required this.newTransaction,
    super.key,
  });

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Border.all(
        color: Colors.white,
        width: 2,
      ),
      borderOnForeground: true,
      elevation: 4,
      color: Colors.white60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () => newTransaction(titleController.text, double.parse(amountController.text)),
              child: const Text('Add transaction'),
            ),
          )
        ],
      ),
    );
  }
}
