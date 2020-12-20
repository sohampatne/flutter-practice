import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _text;
  var questionIndex = 0;
  Question(this._text);

  void nextQuestion() {
    if (questionIndex == questionList.length - 1) {
      questionIndex = 0;
    } else {
      questionIndex++;
    }
  }

  List<String> questionList = [
    'Who are you?',
    'Who is smart?',
    'Who is tired?',
    'Who is the most troublesome?',
    'Who is the most mad?',
    'Who is the most selfless to Soham?'
  ];

  @override
  Widget build(BuildContext context) {
    print("Inside build of Question");
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        _text,
        style: TextStyle(
            fontSize: 24,
            color: Colors.cyan[800],
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
        textAlign: TextAlign.center,
      ),
    );
  }
}
