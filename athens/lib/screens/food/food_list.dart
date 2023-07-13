import 'package:athens/model/food.dart';
import 'package:athens/screens/food/food_card.dart';
import 'package:athens/service/food_service.dart';

import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
  FoodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: FoodService().getAllFood(),
      builder: (context, food) {
        if (food.hasData) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: food.requireData.length,
            itemBuilder: (context, index) {
              return FoodCard(food.requireData[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
          );
        } else if (food.hasError) {
          return Text("Error");
        }
        return SizedBox(
            height: 20, width: 20, child: CircularProgressIndicator());
      },
    );
  }
}
