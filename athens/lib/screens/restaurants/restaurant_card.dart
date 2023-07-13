import 'package:athens/model/restaurant.dart';
import 'package:athens/screens/restaurant/restaurant_screen.dart';
import 'package:athens/screens/utils/clickable.dart';
import 'package:athens/screens/utils/routing.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantCard(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: () {
        Routing.slideToPage(context, RestaurantScreen(restaurant));
      },
      child: Container(
        height: 200,
        width: 200,
        child: Column(
          children: [
            Text(
              restaurant.name
            ),
            const SizedBox(height: 20),
            Text(
              restaurant.description
            )
          ],
        )
      ),
    );
  }
}
