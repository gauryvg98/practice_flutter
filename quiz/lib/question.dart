import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  var options;
  final Function function;
  Question({this.questionText, this.options, this.function});

  List<Widget> getQuestionWidget() {
    List<Widget> list = [
      Container(
        child: Text(
          questionText,
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        width: double.infinity,
        color: Colors.red,
        margin: EdgeInsets.all(0),
      ),
      ...(options.map((option) {
        return Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                function(option['score']);
              },
              child: Text(
                option['text'],
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ));
      }).toList())
    ];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getQuestionWidget(),
    );
  }
}
