import 'package:flutter/material.dart';

import '../../constants/theme_model.dart';

class TriviaSolutionPage extends StatelessWidget {
  final Trivia trivia;
  final TriviaSolution solution;
  final ThemeModel theme = ThemeModel.instance;

  TriviaSolutionPage(this.trivia, this.solution);

  @override
  Widget build(BuildContext context) {
    final bool isCorrect = trivia.isAnswerCorrect(solution);
    final int answerIndex = solution.correctAnswerIndex;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isCorrect ? 'Congrants!' : 'Unlucky!',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isCorrect
              ? Icon(Icons.check_circle_outline,
                  color: theme.maincolor, size: 100)
              : Icon(Icons.highlight_remove_rounded,
                  color: Colors.red, size: 100),
          SizedBox(height: 10),
          isCorrect
              ? Text('Eureka! You win 100 points!',
                  style: TextStyle(fontSize: 18))
              : SizedBox(),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text('Short explaination', style: TextStyle(fontSize: 16)),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Text(
              'The incorrect answer is: ${trivia.answers[answerIndex]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Text(
              solution.comment,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      )),
    );
  }
}
