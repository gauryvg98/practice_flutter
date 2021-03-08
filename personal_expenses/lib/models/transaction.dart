import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  String title;
  int amount;
  DateTime dateTime;
  bool credit;

  Transaction({
    @required this.title,
    @required this.amount,
    this.credit,
    @required this.dateTime,
  });
}
