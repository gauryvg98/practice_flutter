import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard(this.transaction, this._deleteTransaction);

  final Function _deleteTransaction;

  Widget build(BuildContext context) {
    return new Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 2),
            ),
            padding: EdgeInsets.all(5),
            child: Text(
              "₹ " + transaction.amount.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  transaction.title.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  transaction.dateTime.toString().substring(0, 10),
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteTransaction(transaction),
          ),
        ],
      ),
      color: ((transaction.credit) ? Colors.red[300] : Colors.green),
    );
  }
}
