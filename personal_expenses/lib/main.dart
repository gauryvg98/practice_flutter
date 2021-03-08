import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transactionCard.dart';
import 'package:personal_expenses/widgets/usageChart.dart';
import 'package:personal_expenses/widgets/userInputWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      title: "Expenses Tracker",
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];

  void _addToTransactionList(Transaction tx) {
    setState(() {
      transactions.add(tx);
    });
  }

  void _deleteTransaction(Transaction tx) {
    setState(() {
      transactions.remove(tx);
    });
  }

  void _showUserInputWidget(BuildContext ctx) {
    showModalBottomSheet(
        builder: (BuildContext bCtx) {
          return UserInputWidget(_addToTransactionList);
        },
        context: ctx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses Tracker"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showUserInputWidget(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UsageChart(transactions),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  child: ListView(
                    children: transactions.map((tx) {
                      return TransactionCard(tx, _deleteTransaction);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showUserInputWidget(context),
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
