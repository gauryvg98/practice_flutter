import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transactionCard.dart';
import 'package:personal_expenses/widgets/userInputWidget.dart';

class TransactionList extends StatefulWidget {
  TransactionList({Key key}) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> transactions = [
    new Transaction(
      amount: 2080,
      title: "new phones",
      credit: true,
      dateTime: DateTime.now(),
    ),
    new Transaction(
      amount: 1000,
      title: "new phone covers",
      credit: false,
      dateTime: DateTime.now(),
    ),
  ];

  void _addToTransactionList(Transaction tx) {
    setState(() {
      transactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 800,
          child: ListView(
            children: transactions.map((tx) {
              return;
            }).toList(),
          ),
        ),
        UserInputWidget(_addToTransactionList),
      ],
    );
  }
}
