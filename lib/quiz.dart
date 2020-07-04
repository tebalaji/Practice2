import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final Function _answerQuestion;
  final int _questionIndex;
  final List<Map<String, Object>> _questions;

  Quiz(this._answerQuestion, this._questions, this._questionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(_questions[_questionIndex]['questionText']),
        ...(_questions[_questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => _answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
