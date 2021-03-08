import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';

class UserInputWidget extends StatefulWidget {
  UserInputWidget(this._addTx);
  final Function _addTx;
  @override
  _UserInputWidgetState createState() => _UserInputWidgetState(_addTx);
}

class _UserInputWidgetState extends State<UserInputWidget> {
  final amountContoller = TextEditingController();
  final titleController = TextEditingController();
  final Function _addTx;

  _UserInputWidgetState(this._addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              controller: amountContoller,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    elevation: 2,
                    splashColor: Theme.of(context).accentColor,
                    padding: EdgeInsets.all(10),
                    color: Colors.green,
                    child: Text(
                      "Add as Debit ?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    onPressed: () {
                      var tx = new Transaction(
                        amount: int.parse(amountContoller.text),
                        title: titleController.text,
                        dateTime: DateTime.now(),
                        credit: false,
                      );
                      print("added tx : ");
                      _addTx(tx);
                      Navigator.of(context).pop();
                    },
                  ),
                  RaisedButton(
                    elevation: 2,
                    splashColor: Theme.of(context).accentColor,
                    padding: EdgeInsets.all(10),
                    color: Colors.red[300],
                    child: Text(
                      "Add as Credit ?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    onPressed: () {
                      var tx = new Transaction(
                        amount: int.parse(amountContoller.text),
                        title: titleController.text,
                        dateTime: DateTime.now(),
                        credit: true,
                      );
                      print("added tx : ");
                      _addTx(tx);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
