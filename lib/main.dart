import 'dart:ui';

import 'package:app02/quiz.dart';
import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.white;
Color h = Colors.white;
Color b = Colors.black;
Color b1 = Colors.black87;
Color g = Colors.black54;
Color r = Colors.lightGreen;

class _MyAppState extends State<MyApp> {
  bool isSwitched = false;

  int _totalscore = 0;
  int _questionindex = 0;
  int num0 = 0;
  int num1 = 0;
  int num2 = 0;
  void _resetQuiz() {
    setState(() {
      _questionindex = 0;
      _totalscore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
    });
  }

  void f(int score) {
    if (_questionindex == 0)
      num0 = score;
    else if (_questionindex == 1)
      num1 = score;
    else if (_questionindex == 2) num2 = score;
    _totalscore += score;
    setState(() {
      _questionindex += 1;
    });
  }

  final List<Map<String, Object>> _question = [
    {
      'questiontext': 'What\'s your favourite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'green', 'score': 20},
        {'text': 'blue', 'score': 30},
        {'text': 'yellow', 'score': 40}
      ],
    },
    {
      'questiontext': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'dog', 'score': 10},
        {'text': 'cat', 'score': 20},
        {'text': 'rabbit', 'score': 30},
        {'text': 'panda', 'score': 40}
      ],
    },
    {
      'questiontext': 'What\'s your favourite movie?',
      'answers': [
        {'text': 'rush hour', 'score': 10},
        {'text': 'kung fu panda', 'score': 20},
        {'text': 'bad boys', 'score': 30},
        {'text': 'mission impossible', 'score': 40}
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quiz App",
          ),
          backgroundColor: r,
          actions: <Widget>[
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  if (isSwitched == true) {
                    b = Colors.white;
                    w = Colors.black;
                    g = Colors.white;
                    h = Colors.black54;
                    b1 = Colors.lightGreen;
                    r = Colors.black87;
                  }
                  if (isSwitched == false) {
                    w = Colors.white;
                    b = Colors.black;
                    h = Colors.white;
                    g = Colors.black54;
                    r = Colors.lightGreen;
                    b1 = Colors.black87;
                  }
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.grey,
            ),
          ],
        ),
        body: Container(
          color: h,
          child: _questionindex < _question.length
              ? Quiz(_question, _questionindex, f)
              : Result(_resetQuiz, _totalscore),
        ),
        floatingActionButton: _questionindex != 0
            ? FloatingActionButton(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                backgroundColor: r,
                onPressed: () {
                  setState(() {
                    if (_questionindex == 1) {
                      _totalscore -= num0;
                    } else if (_questionindex == 2) {
                      _totalscore -= num1;
                    } else if (_questionindex == 3) {
                      _totalscore -= num2;
                    }
                    if (_questionindex > 0) {
                      _questionindex--;
                    }
                  });
                },
              )
            : FloatingActionButton(
                onPressed: () {},
                backgroundColor: r,
              ),
      ),
    );
  }
}
