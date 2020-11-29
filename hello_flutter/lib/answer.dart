import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnswerButton extends StatelessWidget {
  String answerText;
  Function selector;
  Color buttonColor;
  AnswerButton({this.answerText, this.buttonColor, this.selector});

  @override
  Widget build(BuildContext context) {
    print("Inside build of AnswerButton");
    RaisedButton button = new RaisedButton(
        color: buttonColor, child: new Text(answerText), onPressed: selector);
    // return button;
    return Container(
        width: double.infinity, margin: EdgeInsets.all(1), child: button);
  }
}
