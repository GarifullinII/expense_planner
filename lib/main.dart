import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transaction = [
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

  void _userTransaction(String txTitle, double txAmount) {
    final txTransaction = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    _transaction.add(txTransaction);
    setState(() {});
  }

  void _addNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(
              newTransaction: _userTransaction,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('expense planner'),
        actions: [
          IconButton(
            onPressed: () {
              _addNewTransaction(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 4, top: 4, right: 4),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Text('COST CHART'),
                ),
              ),
            ),
            TransactionList(userTransaction: _transaction),
          ],
        ),
      ),
    );
  }
}
