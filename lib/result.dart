import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  String get resultPhrase {
    String text;
    if (totalScore <= 4) {
      text = 'You are awesome and innocent!';
    } else if (totalScore <= 8) {
      text = 'Pretty likeable!';
    } else {
      text = 'you are....strange?';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
