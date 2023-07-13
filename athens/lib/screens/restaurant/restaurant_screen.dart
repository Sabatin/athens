import 'package:athens/model/food.dart';
import 'package:athens/model/restaurant.dart';
import 'package:athens/screens/restaurant/restaurant_image.dart';
import 'package:athens/service/food_service.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantScreen(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(title: Text(restaurant.name),),
            Container(
              child: RestaurantImage(restaurant.id, 200, 200)
            ),
            SizedBox(height: 10),
            Text(
              restaurant.description
            ),
            FutureBuilder<List<Food>>(
              future: FoodService().getFood(restaurant.id),
              builder: (context, food) {
                if (food.hasData) {

                }
                return SizedBox();
              },
            )
          ],
        )
      ),
    );
  }
}
