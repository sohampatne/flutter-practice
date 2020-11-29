class Question {
  int id;
  String question;
  List<String> options;
  int answerIndex;
  int marks;

  Question(
      {this.id, this.question, this.options, this.answerIndex, this.marks});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'option1': options[0],
      'option2': options[1],
      'option3': options[2],
      'option4': options[3],
      'answer': options[answerIndex],
      'marks': marks,
    };
  }

  @override
  String toString() {
    return 'Question{id: $id, question: $question, option1: $options[0], option2: $options[1], option3: $options[2], option4: $options[3], marks: $marks}';
  }
}

class QuestionBank {
  Question q1 = new Question(
      id: 100,
      question: 'Which of the following is the oldest Veda?',
      options: ['Samaveda', 'Yajurveda', 'Rigveda', 'Atharvaveda'],
      answerIndex: 2,
      marks: 5);

  Question q2 = new Question(
      id: 101,
      question: 'Who is the ‘god of fire’ according to Rigveda?',
      options: ['Agni', 'Indra', 'Soma', 'None of these'],
      answerIndex: 0,
      marks: 5);

  Question q3 = new Question(
      id: 102,
      question: 'In which language is ‘The Rigveda’ written?',
      options: [
        'Vedic Sanskrit',
        'Vedic Hindi',
        'Vedic Tamil',
        'Vedic Marathi'
      ],
      answerIndex: 0,
      marks: 5);

  List<Question> questionList;
  int questionIndex = 0;

  QuestionBank() {
    print('Inside QuestionBank constructor!');
    questionList = new List<Question>();

    questionList.add(q1);
    questionList.add(q2);
    questionList.add(q3);
  }

  Question nextQuestion() {
    Question nqq = questionList[questionIndex];
    if (questionIndex == questionList.length - 1) {
      questionIndex = 0;
    } else {
      questionIndex++;
    }
    return nqq;
  }
}
