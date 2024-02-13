import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;

  const TransactionList({
    required this.userTransaction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: userTransaction.isEmpty
          ? Column(
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
                  height: 300,
                  width: 300,
                ),
              ],
            )
          : ListView.builder(
              itemCount: userTransaction.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: Border.all(
                    color: Colors.black26,
                    width: 2,
                  ),
                  borderOnForeground: true,
                  elevation: 4,
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 16,
                          ),
                          child: Text(
                            '${userTransaction[index].amount.toStringAsFixed(2)} \$',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                userTransaction[index].title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                DateFormat.yMMMMd()
                                    .format(userTransaction[index].date),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
