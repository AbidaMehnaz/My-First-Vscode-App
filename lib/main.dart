import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite anime?',
      'answers': [
        {'text': 'Naruto', 'score': 9},
        {'text': 'One piece', 'score': 10},
        {'text': 'Sword art online', 'score': 5},
        {'text': 'Demon Slayer', 'score': 8},
      ],
    },
    {
      'questionText': 'What\'s your favorite movie genre?',
      'answers': [
        {'text': 'Action', 'score': 10},
        {'text': 'Adventure', 'score': 9},
        {'text': 'Drama', 'score': 4},
        {'text': 'Romance', 'score': 5},
      ]
    },
    {
      'questionText':
          'Do you think there\'s other life forms in our universe outside our world?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 5},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resultQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Abida App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resultQuiz),
      ),
    );
  }
}
