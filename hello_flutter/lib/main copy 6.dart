import 'package:flutter/material.dart';
import './question1.dart';
import './answer1.dart';
import './questionBank.dart';

void main() {
  MyApp sohamTrialApp = new MyApp();
  runApp(sohamTrialApp);
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int score = 0;
  Question currentQuestion;
  QuestionBank questionBank;

  MyAppState() {
    print('Inside MyAppState constructor');
    questionBank = new QuestionBank();
    currentQuestion = questionBank.nextQuestion();
    print(currentQuestion.question);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Future<Album> futureAlbum = fetchAlbum();
  // }

  void nextQuestion(String selectedAnswer) {
    print(selectedAnswer);
    String rightAnswer = currentQuestion.options[currentQuestion.answerIndex];
    print(rightAnswer);

    if (rightAnswer == selectedAnswer) {
      score++;
    } else if (rightAnswer != selectedAnswer) {
      score--;
    }

    setState(() {
      currentQuestion = questionBank.nextQuestion();
    });
    print(currentQuestion.question);
  }

  @override
  Widget build(BuildContext context) {
    print('Inside MyAppState build');
    
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.brown[600],
          title: Container(
            width: double.infinity,
            child: Text(
              'History, Chapter 4 - MCQs',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          )),
      body: Column(children: [
        QuestionText('Your score = $score'),
        QuestionText(currentQuestion.question),
        AnswerButton(
          currentQuestion.options[0],
          onPressFunction: () {
            nextQuestion(currentQuestion.options[0]);
          },
          buttonColor: Colors.yellow[200],
        ),
        AnswerButton(
          currentQuestion.options[1],
          onPressFunction: () {
            nextQuestion(currentQuestion.options[1]);
          },
          buttonColor: Colors.red[200],
        ),
        AnswerButton(
          currentQuestion.options[2],
          onPressFunction: () {
            nextQuestion(currentQuestion.options[2]);
          },
          buttonColor: Colors.blue[200],
        ),
        AnswerButton(
          currentQuestion.options[3],
          onPressFunction: () {
            nextQuestion(currentQuestion.options[3]);
          },
          buttonColor: Colors.green[200],
        ),
      ]),
    ));
  }
}
