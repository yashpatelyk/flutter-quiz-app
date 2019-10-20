import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(MyClass());

class MyClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyClassState();
  }
}

class MyClassState extends State<MyClass> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 8},
        {'text': 'Black', 'score': 5},
        {'text': 'Green', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Elephant', 'score': 1},
        {'text': 'Lion', 'score': 2},
        {'text': 'Tiger', 'score': 3},
        {'text': 'Sheep', 'score': 4},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _onPressed(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1 % _questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _onPressed,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
