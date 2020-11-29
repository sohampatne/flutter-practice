import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  String qText;
  QuestionText(this.qText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        qText,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.cyan[800],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
