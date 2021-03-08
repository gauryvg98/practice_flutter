import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';

class UsageChart extends StatelessWidget {
  final List<Transaction> transactions;

  List<Widget> buildMapOnType() {
    Map<bool, int> mp = new Map();
    mp[true] = 0;
    mp[false] = 0;
    int _total = 0;
    transactions.forEach((tx) {
      mp[tx.credit] += tx.amount;
      _total += tx.amount;
    });

    //return list<Widgets here>

    List<Widget> list = new List();

    mp.forEach((k, v) {
      list.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "₹ " + v.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 33,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: v / _total,
                    child: Container(
                      decoration: BoxDecoration(
                        color: k ? Colors.red[300] : Colors.green,
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              k ? "Credit" : "Debit",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    });

    return list;
  }

  UsageChart(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: (transactions.length == 0) ? List() : buildMapOnType(),
      ),
    );
  }
}
