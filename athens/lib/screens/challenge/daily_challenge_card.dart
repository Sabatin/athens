import 'package:athens/constants/theme_model.dart';
import 'package:flutter/material.dart';

class DailyChallenge extends StatelessWidget {
  final ThemeModel theme = ThemeModel.instance;
  final containerRadius = BorderRadius.all(Radius.circular(26));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Challenge>(
        future: ChallengeProxy.getDailyChallenge(),
        builder: (context, challenge) {
          if (challenge.hasData) {
            return ConsciousClickable(
              onTap: () {
                Routing.slideToPage(context, ChallengePage(challenge.data!));
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
                          gradient: theme.gradientList[2],
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
                                  "Daily Challenge\nGet your 200 points!",
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
                              'Make some actual change in the real world!',
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
          } else if (challenge.hasError) {
            return SizedBox();
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 200,
          );
        });
  }
}
