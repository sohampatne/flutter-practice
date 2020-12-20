import 'package:flutter/material.dart';

//void main() {
//  runApp(SohamApp());
//}

class SohamApp { // extends StatelessWidget {
  var questionList = [
        'Who are you?'
        'What is you favourite colour?'
        'What is you favourite bird?'
        'What is you favourite animal?'
        'What is you favourite game?'
  ];
  int questionIndex = 0;
  
  void clickedMe() {}

  //@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Soham\'s Trial App')),
        body: Column(
          children: [
            Text('My Question!'),
            RaisedButton(
              child: Text('Soham'),
              onPressed: () {},
            ),
            RaisedButton(child: Text('Vinod'), onPressed: () {}),
            RaisedButton(child: Text('Mrunal'), onPressed: () {}),
            RaisedButton(child: Text('Advait'), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
