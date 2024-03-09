import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTransaction;

  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      shape: Border.all(
        color: Colors.white10,
        width: 2,
      ),
      borderOnForeground: true,
      elevation: 4,
      color: Theme.of(context).primaryColor,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            '${transaction.amount.toStringAsFixed(2)} \$',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            transaction.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            DateFormat.yMMMMd().format(transaction.date),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        trailing: mediaQuery.size.width > 460
            ? ElevatedButton.icon(
                onPressed: () => deleteTransaction(transaction.id),
                icon: Icon(
                  Icons.delete_sharp,
                  color: Theme.of(context).colorScheme.error,
                ),
                label: const Text('Delete'),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete_sharp,
                  color: Theme.of(context).colorScheme.error,
                ),
                onPressed: () => deleteTransaction(transaction.id),
              ),
      ),
    );
  }
}
