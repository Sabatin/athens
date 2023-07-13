import 'package:athens/constants/theme_model.dart';
import 'package:athens/model/trivia/trivia.dart';
import 'package:athens/screens/trivia/trivia_page.dart';
import 'package:athens/screens/utils/clickable.dart';
import 'package:athens/screens/utils/routing.dart';
import 'package:athens/service/trivia_service.dart';
import 'package:flutter/material.dart';

class DailyTrivia extends StatelessWidget {
  final ThemeModel theme = ThemeModel.instance;
  final containerRadius = BorderRadius.all(Radius.circular(26));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Trivia>(
        future: TriviaProxy.getDailyTrivia(),
        builder: (context, trivia) {
          if (trivia.hasData) {
            return Clickable(
              onTap: () {
                Routing.slideToPage(context, TriviaPage(trivia.data!));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 200,
                child: GestureDetector(
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          gradient: theme.gradientList[1],
                          borderRadius: containerRadius),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 15, top: 20),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Daily Trivia\nGet your 100 points!",
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Icon(Icons.recycling_outlined,
                                  color: Colors.white),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15, top: 20),
                            child: Text(
                              'How much do you know about sustainability?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (trivia.hasError) {}
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 200,
          );
        });
  }
}
