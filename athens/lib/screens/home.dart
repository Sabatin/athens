import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/theme_model.dart';
import 'home_helpers.dart/profile_card.dart';
import 'restaurants/restaurants_screen.dart';

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
              'Suggested for you',
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
          Container(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'Best value',
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

class ErrorImageNetwork extends StatelessWidget {
  const ErrorImageNetwork(this.height);
  final double height;

  static const String url =
      'https://user-images.githubusercontent.com/47315479/81145216-7fbd8700-8f7e-11ea-9d49-bd5fb4a888f1.png';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
          height: 150, width: width, child: const CircularProgressIndicator()),
      errorWidget: (context, url, error) => Container(
          height: 150, width: width, child: const CircularProgressIndicator()),
    );
  }
}
