import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart'; // SQL Lite Database - SQ Flutter Lite

import 'package:hello_flutter/questionBank.dart';

void main() async {
  String dbName = 'question_database.db';

  String onCreateQuery = "CREATE TABLE questions(" +
      "id INTEGER PRIMARY KEY," +
      "question TEXT, " +
      "options1 TEXT, " +
      "options2 TEXT, " +
      "options3 TEXT, " +
      "options4 TEXT, " +
      "answer TEXT, " +
      "marks INTEGER, " +
      ")";


  Question q1 = new Question(
      question: 'Which of the following is the oldest Veda?',
      options: ['Samaveda', 'Yajurveda', 'Rigveda', 'Atharvaveda'],
      answerIndex: 2,
      marks: 5);

  Question q2 = new Question(
      question: 'Who is the ‘god of fire’ according to Rigveda?',
      options: ['Agni', 'Indra', 'Soma', 'None of these'],
      answerIndex: 0,
      marks: 5);

  Question q3 = new Question(
      question: 'In which language is ‘The Rigveda’ written?',
      options: [
        'Vedic Sanskrit',
        'Vedic Hindi',
        'Vedic Tamil',
        'Vedic Marathi'
      ],
      answerIndex: 0,
      marks: 5);

  Database database = await openDB(dbName, onCreateQuery);
  
  insertQuestion(database, q1);
  insertQuestion(database, q2);
  insertQuestion(database, q3);

  // Print the list of questions
  print(await list(database));
}

Future<Database> openDB(String dbName, String onCreateQuery) async {
  print('Open the database and store the reference.');

  String dbPath = await getDatabasesPath();
  // join(dbPath, dbName),

  final Future<Database> database = openDatabase(
    join(dbPath, dbName),
    onCreate: (db, version) {
      print('Inside onCreate - Create table');
      return db.execute(
        onCreateQuery,
      );
    },
    version: 1,
  );

  return database;
}

Future<void> insertQuestion(Database db, Question question) async {
  // Insert the record into the correct table. Also specify the
  // `conflictAlgorithm`. In this case, if the same dog is inserted
  // multiple times, it replaces the previous data.
  await db.insert(
    'questions',
    question.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Question>> list(Database db) async {
  print('Inside gets dogs list');

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('questions');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Question(
      id: maps[i]['id'],
      question: maps[i]['question'],
      options: [
        maps[i]['option1'],
        maps[i]['option2'],
        maps[i]['option3'],
        maps[i]['option4']
      ],
      marks: maps[i]['marks'],
    );
  });
}
