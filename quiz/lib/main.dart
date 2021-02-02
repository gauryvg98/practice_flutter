import 'package:flutter/material.dart';
import 'package:quiz/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;
  void _incrementQuestionIndex(int score) {
    setState(() {
      _questionIndex++;
    });
    _totalScore += score;
    print(_questionIndex);
  }

  var questions = [
    {
      "questionText": "Question 1",
      "options": [
        {"text": "a1", "score": 5},
        {"text": "a2", "score": 0},
        {"text": "a3", "score": 0}
      ]
    },
    {
      "questionText": "Question 2",
      "options": [
        {"text": "b1", "score": 5},
        {"text": "b2", "score": 0},
        {"text": "b3", "score": 0},
        {"text": "b4", "score": 5}
      ]
    },
    {
      "questionText": "Question 3",
      "options": [
        {"text": "c1", "score": 5},
        {"text": "c2", "score": 0}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            Text("main shit"),
            Text("side shit"),
          ],
        )),
        body: (_questionIndex < questions.length)
            ? Question(
                function: _incrementQuestionIndex,
                questionText: questions[_questionIndex]['questionText'],
                options: questions[_questionIndex]['options'],
              )
            : Column(children: [
                Container(
                  width: double.infinity,
                  color: Colors.red,
                  child: Text(
                    "Completed boi!!",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Restart?",
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: () {
                    setState(() {
                      _questionIndex = 0;
                      _totalScore = 0;
                    });
                  },
                )
              ]),
      ),
    );
  }
}
