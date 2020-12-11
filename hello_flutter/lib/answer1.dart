import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  String ansText;
  Color buttonColor;
  FontWeight fontWeight;
  Function onPressFunction;

  AnswerButton(this.ansText, {this.onPressFunction, this.buttonColor = Colors.yellow, this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    RaisedButton button = new RaisedButton(
        color: buttonColor,
        child: Text(
          ansText,
          style: TextStyle(fontWeight: fontWeight),
        ),
        onPressed: onPressFunction);

    return Container(
      child: button,
    );
  }
}
