import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp3());
}

// ignore: must_be_immutable
class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Trial App')),
        body: Column(children: [
          Text('Who is the smartest of all?'),
          Text('choose best option from below:'),
          RaisedButton(child: Text("You"), onPressed: null,),
          RaisedButton(child: Text("Me"), onPressed: null,),
          RaisedButton(child: Text("Others"), onPressed: null,),
          RaisedButton(child: Icon(Icons.brush), onPressed: null,),
        ], ),
      ),
    );
  }
}


// ignore: must_be_immutable
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Trial App')),
        body: Text('This the body-text of my App!'),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text('Hello Soham and Baba!'),
    );
  }
}
