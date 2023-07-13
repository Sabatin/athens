import 'package:athens/constants/theme_model.dart';
import 'package:athens/screens/food/food_list.dart';
import 'package:athens/screens/restaurants/restaurants_list.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream:athens/lib/screens/home/home.dart
import 'home_helpers.dart/profile_card.dart';
=======

import '../constants/theme_model.dart';
import 'home_helpers.dart/invite_friend.dart';
import 'home_helpers.dart/profile_card.dart';
import 'restaurants/restaurants_list.dart';
import 'trivia/daily_trivia_card.dart';
>>>>>>> Stashed changes:athens/lib/screens/home.dart

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final containerRadius = BorderRadius.all(Radius.circular(20));
  final ThemeModel theme = ThemeModel.instance;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: ListView(
        children: <Widget>[
          ProfileCard(),
          Container(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
<<<<<<< Updated upstream:athens/lib/screens/home/home.dart
              'Restaurants suggested for you',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 240,
            child: RestaurantsList(),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
=======
>>>>>>> Stashed changes:athens/lib/screens/home.dart
              'Best value boxes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 240,
            child: FoodList(),
          ),
          DailyTrivia(),
          Container(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'Restourants suggested for you',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            height: 240,
            child: RestaurantsList(),
          ),
          InviteFriendsCard(),
        ],
      ),
    );
  }
}

class HomeActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 20, left: 5),
        child: Icon(Icons.account_circle_outlined, size: 27));
  }
}
