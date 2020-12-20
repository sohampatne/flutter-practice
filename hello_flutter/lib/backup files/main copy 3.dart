import 'package:flutter/material.dart';

void main() {
  runApp(MyApp1());
}

// ignore: must_be_immutable
class MyApp1 extends StatelessWidget {
  var clickCount = 0;
  var questionIndex = 0;

  var questionList = [
    'Who are you?',
    'Who is smart?',
    'Who is tired?'
  ];

void nextQ() {
    questionIndex++;    
    print(questionIndex);
  }

  void clickedMe() {
    clickCount++;
    print('Hello?');
    print('Click Count');
    print(clickCount);
  } 

  @override
  Widget build(BuildContext context) {
    var myClickCount = 0;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('This is the sample bar text of my app!')),
          body: Column(
            children: [
              Text(questionList[questionIndex]),
              Row(
                children: [
                  RaisedButton(
                    child: Text('Soham'), onPressed: clickedMe),
                  RaisedButton(
                    child: Text('Advait'),
                    onPressed: () => print(myClickCount++),
                  ),
                  RaisedButton(
                    child: Text('Vinod'),
                    onPressed: () {
                      print('Hello Vinod!');
                      print('Hi Vinod!(Again)');
                    },
                  ),
                ],
              ),
              RaisedButton(child: Text('SUBMIT'), onPressed: nextQ),
            ],
          )),
    );
  }
}
