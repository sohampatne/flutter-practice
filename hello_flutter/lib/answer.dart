import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  String buttonName;
  Function onPressedFunction;
  Color color = Colors.tealAccent;

  AnswerButton({this.buttonName, this.color, this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(child: Text(buttonName, style: TextStyle(fontSize: 24)), color: color, onPressed: onPressedFunction));
  }
}