import 'package:athens/model/food.dart';
import 'package:athens/screens/order/food_order.dart';
import 'package:athens/screens/utils/clickable.dart';
import 'package:athens/screens/utils/routing.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  FoodCard(this.food);

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: () {
        Routing.slideToPage(context, FoodOrder(food));
      },
      child: Container(
        height: 200,
        width: 200,
        child: Column(
          children: [
            Text(
              food.name
            ),
            Text(
              food.description
            )
          ],
        )
      ),
    );
  }
}
