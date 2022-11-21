import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Purple', 'score': 10},
        {'text': 'Yellow', 'score': 5},
        {'text': 'Blue', 'score': 8}
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Impala', 'score': 10},
        {'text': 'Giant Octopus', 'score': 7},
        {'text': 'Dire Wolf', 'score': 6},
        {'text': 'Brown Bear', 'score': 5}
      ],
    }
  ];

  void _resetQuiz() {
    _questionIndex = 0;
    _totalScore = 0;
    setState(() => {});
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
