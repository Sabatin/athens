import 'package:athens/constants/theme_model.dart';
import 'package:athens/screens/food/food_list.dart';
import 'package:athens/screens/restaurants/restaurants_list.dart';
import 'package:flutter/material.dart';
import 'home_helpers.dart/profile_card.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final containerRadius = BorderRadius.all(Radius.circular(25));
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
          //DailyTrivia(),
          //DailyChallenge(),
          //InviteFriendsCard(),
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
