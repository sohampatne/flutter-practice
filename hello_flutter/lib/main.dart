import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import './question.dart';
import './answer.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int totalScore = 0;
  Color gameOverColor = Colors.transparent;
  int qIndex = 0;

  var questions = ['What is 1+5?', 'What is 2+6?', 'What is 9+2?', 'What is 5+2?', 'What is 3+3?'];

  static List q1Options = ['6', '1', '2', '3'];
  static List q2Options = ['4', '8', '5', '6'];
  static List q3Options = ['9', '7', '11', '8'];
  static List q4Options = ['5', '7', '9', '12'];
  static List q5Options = ['2', '6', '7', '4'];
  static List options = [q1Options, q2Options, q3Options, q4Options, q5Options];
  static List answers = ['6', '8', '11', '7', '6'];

  //final dir = await getApplicationDocumentsDirectory();

  AudioCache audioCache = new AudioCache();
  AudioPlayer advancedPlayer = new AudioPlayer();
  // String localFilePath;
  int denominator = 5;
  String playOrRetry = '';

  void submitQuestion(String choosenAns) {
    print('choosen answer = ' + choosenAns);

    // print('Current local file path: $localFilePath');

    var correctAns = answers[qIndex];
    print('correct answer = ' + correctAns);

    if (choosenAns == correctAns) {
      print("Awesome! Correct Answer!");
      audioCache.play('audios/awesome.mp3');
      // audioCache.play('audios/wow.mp3');
      totalScore++;
    } else {
      print('Oh no, you loose!');
      audioCache.play('audios/oops.mp3');
      // audioCache.play('audios/wow.mp3');
    }

    Timer(Duration(milliseconds: 1000), nextQuestion);

    // _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
    //   print(DateTime.now());
    //   nextQuestion();
    // });
  }

  void nextQuestion() {
    // _timer.cancel();
    print('Begin MyApp nextQuestion Method questionIndex=$qIndex');

    if (qIndex == questions.length - 1) {
      endTest();
    } else
      qIndex++;

    print(qIndex);

    setState(() {
      print('Begin MyApp nextQuestion->setState Method');
    });
  }

  void endTest() {
    gameOverColor = Colors.cyan; //[800]
    if (totalScore == 2) {
      playOrRetry = 'You loose, retry';
    } else if (totalScore >= 3) {
      playOrRetry = 'You won! Play again';
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Begin MyApp Build Method');
    return MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal, // or Colors.green or any color darker than white (this is line 66)
        accentColor: Colors.black,
      ),
      home: Scaffold(
          backgroundColor: Colors.cyan[100], //
          appBar: AppBar(
            title: Text('Game for Kids'),
          ),
          body: Column(children: [
            QuestionText(questions[qIndex]),
            AnswerButton(
              buttonName: options[qIndex][0],
              color: Colors.red[200], //
              onPressedFunction: () {
                submitQuestion(options[qIndex][0]);
              },
            ),
            AnswerButton(
              buttonName: options[qIndex][1],
              color: Colors.yellow[200], //
              onPressedFunction: () {
                submitQuestion(options[qIndex][1]);
              },
            ),
            AnswerButton(
              buttonName: options[qIndex][2],
              color: Colors.blue[200], //[200]
              onPressedFunction: () {
                submitQuestion(options[qIndex][2]);
              },
            ),
            AnswerButton(
              buttonName: options[qIndex][3],
              color: Colors.green[200], //[200]
              onPressedFunction: () {
                submitQuestion(options[qIndex][3]);
              },
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  'GAME OVER' + 'Score = $totalScore/$denominator',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: gameOverColor),
                )),
            Container(
                width: double.infinity,
                child: RaisedButton(
                    child: Text(playOrRetry),
                    color: Colors.transparent,
                    onPressed: () {
                      qIndex = -1;
                      totalScore = 0;
                      gameOverColor = Colors.transparent;
                      playOrRetry = "";
                      nextQuestion();
                    }))
          ])),
    );
  }
}
