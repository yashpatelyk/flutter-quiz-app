import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    this.questions,
    this.questionIndex,
    this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> answers =
        (questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
      return Answer(answer['text'], () => answerQuestion(answer['score']));
    }).toList();

    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        ...answers,
      ],
    );
  }
}
