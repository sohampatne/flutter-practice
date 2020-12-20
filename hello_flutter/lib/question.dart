import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  String text;

  QuestionText(this.text);
  @override
  Widget build(BuildContext context) {
    // return Text(Text);
    return Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));
  }
}