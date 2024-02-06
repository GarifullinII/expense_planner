import 'package:expense_planner/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Transaction> transactions = [
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('expense planner'),
      ),
      body: Column(
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
          Padding(
            padding: const EdgeInsets.all(4),
            child: Card(
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
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add transaction'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: transactions.map((transaction) {
                return Card(
                  shape: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderOnForeground: true,
                  elevation: 4,
                  color: Colors.white60,
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
                            '${transaction.amount} \$',
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
                                transaction.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.yMMMMd().format(transaction.date),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
