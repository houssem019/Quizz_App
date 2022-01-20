import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final Function q;
  final resultscore;

  Result(this.q, this.resultscore);
  String get resultPhrase {
    String resultText;
    if (resultscore >= 70) {
      resultText = "You are awesome !";
    } else if (resultscore >= 40 && resultscore < 70) {
      resultText = "Pretty likable !";
    } else {
      resultText = "You are so bad !";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Your score is: $resultscore \n" + resultPhrase,
            style:
                TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: b),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              "Restart the App",
              style: TextStyle(fontSize: 30, color: r),
            ),
            onPressed: () => q(),
          ),
        ],
      ),
    );
  }
}
