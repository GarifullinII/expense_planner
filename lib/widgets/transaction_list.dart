import 'package:expense_planner/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
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
    print('build() TransactionList');
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
                child: TransactionItem(
                  transaction: userTransaction[index],
                  deleteTransaction: deleteTransaction,
                ),
              );
            },
          );
  }
}
