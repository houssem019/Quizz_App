import 'package:app02/main.dart';
import 'package:flutter/material.dart';

class Answser extends StatelessWidget {
  final answertext;
  final Function x;

  Answser(this.x, this.answertext);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: RaisedButton(
        color: r,
        textColor: Colors.white,
        child: Text(
          answertext,
          style: TextStyle(fontSize: 25, color: b),
        ),
        onPressed: () => x(),
      ),
    );
  }
}
