import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionindex;
  final Function f;

  Quiz(this.question, this.questionindex, this.f);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(question[questionindex]['questiontext']),
        ...(question[questionindex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answser(() => f(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
