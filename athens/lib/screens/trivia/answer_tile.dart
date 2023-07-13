import 'package:flutter/material.dart';

import '../../constants/theme_model.dart';

class AnswerTile extends StatelessWidget {
  final ThemeModel theme = ThemeModel.instance;
  final Trivia trivia;
  final int index;

  AnswerTile(this.trivia, this.index);

  @override
  Widget build(BuildContext context) {
    return ConsciousClickable(
      onTap: () async {
        trivia.selectAnswer(index);
        OverlayLoader.showLoading(context);
        final TriviaSolution solution =
            await TriviaProxy.submitAnswer(trivia, index);
        OverlayLoader.unshowLoading();
        Routing.slideToPage(context, TriviaSolutionPage(trivia, solution));
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: theme.maincolor),
          padding: EdgeInsets.all(15),
          child: Container(
              child: Text(
            trivia.answers[index],
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ))),
    );
  }
}
