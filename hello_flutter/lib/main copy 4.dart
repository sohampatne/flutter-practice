import 'package:flutter/material.dart';
import 'package:hello_flutter/answer.dart';
import './answer.dart';
import './question.dart';

void main() {
  print("Inside main");
  runApp(MyApp());
  print("End of main");
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("Inside createState");
    var myState = _MyAppState();
    //myState.questionList.removeAt(0);
    //myState.questionList.removeAt(1);
    return myState;
  }
}

// ignore: must_be_immutable
class _MyAppState extends State<MyApp> {
  var clickCount = 0;
  var _questionIndex = 0;

  List<String> questionList = [
    'Who are you?',
    'Who is smart?',
    'Who is tired?',
    'Who is the most troublesome?',
    'Who is the most mad?',
    'Who is the most selfless to Soham?'
  ];

  void nextQ() {
    print("Inside nextQ");
    print(questionList.length);

    setState(mystatefn);
    print(_questionIndex);
  }

  void mystatefn() {
    if (_questionIndex == questionList.length - 1) {
      _questionIndex = 0;
    } else {
      _questionIndex++;
    }
  }

  void clickedMe() {
    clickCount++;
    print('Hello?');
    print('Click Count');
    print(clickCount);
  }

  @override
  Widget build(BuildContext context) {
    print("Inside build of _MyAppState");

    Text titleText = Text('This is the sample bar text of my app!');

    Question questionText = Question(questionList[_questionIndex]);
    //questionText._text = 'Hello';

    AnswerButton sohamButton =
        new AnswerButton(answerText: 'Soham', buttonColor: Colors.red[100], selector: nextQ);
    AnswerButton vinodButton =
        new AnswerButton(answerText: 'Vinod', buttonColor: Colors.yellow[100], selector: nextQ);
    AnswerButton advaitButton =
        new AnswerButton(answerText: 'Advait', buttonColor: Colors.blue[100], selector: nextQ);
    AnswerButton mrunalButton =
        new AnswerButton(answerText: 'Mrunal', buttonColor: Colors.green[100], selector: nextQ);

/*
    RaisedButton vinodButton1 = new RaisedButton(
        color: Colors.blue,
        child: new Text('Vinod'),
        onPressed: () {
          clickedMe();
          nextQ();
        });

    RaisedButton advaitButton1 = new RaisedButton(
        color: Colors.blue,
        child: new Text('Advait'),
        onPressed: () {
          clickedMe();
          nextQ();
        });
*/
    //var myClickCount = 0;
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(title: titleText),
          body: new Column(
            children: [
              questionText,
              Column(
                children: [
                  sohamButton,
                  advaitButton,
                  vinodButton,
                  mrunalButton
                ],
              ),
            ],
          )),
    );
  }
}
