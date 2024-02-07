import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'Milk',
      amount: 98.20,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'PC',
      amount: 200100,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Soap',
      amount: 68.90,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: NewTransaction(),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: TransactionList(
            userTransaction: _userTransaction,
          ),
        ),
      ],
    );
  }
}