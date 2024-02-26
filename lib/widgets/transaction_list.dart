import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTransaction;

  const TransactionList({
    required this.userTransaction,
    required this.deleteTransaction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return userTransaction.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'No transaction added yet!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Image.asset(
                    'assets/images/sleep.png',
                    height: constraints.maxHeight * 0.7,
                    width: constraints.maxWidth * 0.7,
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: userTransaction.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(4),
                child: Card(
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
                        '${userTransaction[index].amount.toStringAsFixed(2)} \$',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        userTransaction[index].title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        DateFormat.yMMMMd().format(userTransaction[index].date),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? ElevatedButton.icon(
                            onPressed: () =>
                                deleteTransaction(userTransaction[index].id),
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
                            onPressed: () =>
                                deleteTransaction(userTransaction[index].id),
                          ),
                  ),
                ),
              );
            },
          );
  }
}
