import 'package:athens/model/food.dart';
import 'package:athens/model/restaurant.dart';
import 'package:athens/screens/food/food_card.dart';
import 'package:athens/screens/restaurant/restaurant_screen.dart';
import 'package:athens/screens/utils/clickable.dart';
import 'package:athens/service/food_service.dart';
import 'package:flutter/material.dart';

class FoodOrder extends StatelessWidget {
  final Food food;

  FoodOrder(this.food);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food.name)),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            height: 240,
            child: FoodCard(food),
          ),
          Clickable(
            onTap: () async {
              FoodService.buyFood(food.id, food.id);
            },
            child: Container(height: 50, width: 50, child: Text("Order")),
          )
        ],
      )),
    );
  }
}
