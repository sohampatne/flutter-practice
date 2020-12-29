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
  Color gameOverBGColor = Colors.transparent;
  int qIndex = 0;

  var questions = ['What is 1+5?', 'What is 2+6?', 'What is 9+2?', 'What is 5+2?', 'What is 3+3?'];

  static List q1Options = ['6', '1', '2', '3', '7'];
  static List q2Options = ['4', '8', '5', '6', '9'];
  static List q3Options = ['9', '7', '11', '8', '4'];
  static List q4Options = ['5', '7', '9', '12', '2'];
  static List q5Options = ['2', '6', '7', '4', '5'];
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

    Timer(Duration(seconds: 3), nextQuestion);

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
    }
    qIndex++;

    print(qIndex);

    setState(() {
      print('Begin MyApp nextQuestion->setState Method');
    });
  }

  void endTest() {
    print('Game Over');
    gameOverColor = Colors.cyanAccent[700];
    gameOverBGColor = Colors.teal[100];
    playOrRetry = "???";
    if (totalScore <= 2) {
      playOrRetry = 'You loose, retry';
    } else if (totalScore >= 3) {
      playOrRetry = 'You won! Play again';
    }
  }

  @override
  Widget build(BuildContext context) {
    // final names = ['Max', 'Manu'];
    // final result = names.map((name) => Text(name)).toList();

    List<Widget> questionAnswerButtons = List<Widget>();
    print(' qIndex=$qIndex');
    print(' questions.length=${questions.length}');

    if (qIndex < questions.length) {
      List<dynamic> currentQuestionOptions = options[qIndex];
      List<Widget> optionButtons = List<Widget>();
      var colorOptions = [Colors.red, Colors.yellow, Colors.blue, Colors.green, Colors.deepPurple];

/*      |🤔|------------------------------💡|REMEMBER|💡------------------------------|🤔|
        for(you can attach any variables you need in this for loop;
        define the argument here;
        insert the function or method that that should be called at the end of this for loop) 
*/
      for (int index = 0; index < currentQuestionOptions.length; index++) {
        AnswerButton button = AnswerButton(
          buttonName: currentQuestionOptions[index],
          color: colorOptions[qIndex][100 * (index + 1)],
          onPressedFunction: () {
            submitQuestion(currentQuestionOptions[index]);
          },
        );
        optionButtons.add(button);
      }

      questionAnswerButtons.add(QuestionText(questions[qIndex]));
      questionAnswerButtons.addAll(optionButtons);
    }

    print('Begin MyApp Build Method');
    return MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal, // or Colors.green or any color darker than white (this is line 66)
        accentColor: Colors.black,
      ),
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Game for Kids'),
            elevation: 0,
          ),
          body: Column(children: [
            ...questionAnswerButtons,
            // ...result,
            Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  '\n\n\nGAME OVER\nScore = $totalScore/$denominator',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: gameOverColor,
                  ),
                  textAlign: TextAlign.center,
                )),
            Container(
                width: double.infinity,
                child: RaisedButton(
                    child: Text(playOrRetry,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: gameOverColor,
                        )),
                    color: gameOverBGColor,
                    elevation: 0,
                    onPressed: () {
                      qIndex = -1;
                      totalScore = 0;
                      playOrRetry = "";
                      gameOverColor = Colors.transparent;
                      gameOverBGColor = Colors.transparent;
                      nextQuestion();
                    }))
          ])),
    );
  }
}
