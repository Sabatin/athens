import 'package:athens/model/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantCard(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
