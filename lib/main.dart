import 'package:expense_planner/widgets/chart.dart';
import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal expenses',
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'OpenSans',
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
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
    // Transaction(
    //   id: 't1',
    //   title: 'Milk',
    //   amount: 98.20,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'PC',
    //   amount: 200100,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't3',
    //   title: 'Soap',
    //   amount: 68.90,
    //   date: DateTime.now(),
    // ),
  ];

  late bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transaction.where(
      (element) {
        return element.date.isAfter(
          DateTime.now().subtract(
            const Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void _userTransaction(String txTitle, double txAmount, DateTime txDate) {
    final txTransaction = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: txDate,
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

  void _deleteTransaction(String id) {
    setState(
      () {
        _transaction.removeWhere((element) => element.id == id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final dynamic appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text(
              'Personal expenses',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                  child: const Icon(CupertinoIcons.add),
                  onPressed: () {
                    _addNewTransaction(context);
                  },
                ),
              ],
            ),
          )
        : AppBar(
            title: const Text('Personal expenses'),
            backgroundColor: Theme.of(context).primaryColor,
            actions: [
              IconButton(
                onPressed: () {
                  _addNewTransaction(context);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          );
    final txListWidget = SizedBox(
      height: (mediaQuery.size.height - appBar.preferredSize.height) * 0.7,
      child: TransactionList(
          userTransaction: _transaction, deleteTransaction: _deleteTransaction),
    );
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show chart',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Switch(
                    value: _showChart,
                    onChanged: (val) {
                      _showChart = val;
                      setState(() {});
                    },
                  )
                ],
              ),
            if (!isLandscape)
              SizedBox(
                height:
                    (mediaQuery.size.height - appBar.preferredSize.height) * 0.3 -
                        mediaQuery.padding.top,
                child: Chart(
                  recentTransactions: _recentTransactions,
                ),
              ),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              _showChart
                  ? Padding(
                      padding: const EdgeInsets.only(left: 4, top: 4, right: 4),
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: SizedBox(
                            height: (mediaQuery.size.height -
                                        appBar.preferredSize.height) *
                                    0.7 -
                                mediaQuery.padding.top,
                            child: Chart(
                              recentTransactions: _recentTransactions,
                            ),
                          ),
                        ),
                      ),
                    )
                  : txListWidget,
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: pageBody,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
          );
  }
}
