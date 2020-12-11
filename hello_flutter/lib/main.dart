import 'package:flutter/material.dart';
import 'soham/SAppBarFactory.dart';
import 'soham/SButtonFactory.dart';

void main() {
  runApp(MyApp());
}

int questionIndexGenerator = 0;
int counter = 0;

void addCounter() {
  counter++;
  print(counter);
}

var questions = [
  'What is your name',
  'What is your gender',
  'Why have you come here?',
  'Are you mad?',
  'If you are a boy- Are you a good girl or a bad boy',
  'If you are a girl- Are you a good boy or a bad girl'
];

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  void questionIndex() {
    setState(() {
      counter++;
      print(counter);
      if (questionIndexGenerator == questions.length - 1) {
        questionIndexGenerator = 0;
      } else {
        questionIndexGenerator++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: SAppBarFactory.createAppBar('Trial App, counter=' + counter.toString(), Colors.green),
            body: Column(children: [
              Text(questions[questionIndexGenerator]),
              SButtonFactory.createRaisedButton('Option1', Colors.yellow, questionIndex),
              SButtonFactory.createRaisedButton('Option2', Colors.red, questionIndex),
              SButtonFactory.createRaisedButton('Option3', Colors.cyan, questionIndex),
              SButtonFactory.createRaisedButton('Option3', Colors.purple, questionIndex),
            ])));
  }
}
