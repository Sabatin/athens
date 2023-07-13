import 'package:athens/model/food.dart';
import 'package:athens/model/restaurant.dart';
import 'package:athens/screens/food/food_card.dart';
import 'package:athens/screens/order/order_success.dart';
import 'package:athens/screens/restaurant/restaurant_screen.dart';
import 'package:athens/screens/utils/clickable.dart';
import 'package:athens/screens/utils/overlay_loader.dart';
import 'package:athens/screens/utils/routing.dart';
import 'package:athens/service/food_service.dart';
import 'package:flutter/material.dart';

class FoodOrder extends StatelessWidget {
  final Food food;

  FoodOrder(this.food);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(title: Text(food.name)),
            FoodCard(food),
            Clickable(
              onTap: () async {
                try {
                  OverlayLoader.showLoading(context);
                  await FoodService.buyFood(food.id, food.id);
                  OverlayLoader.unshowLoading();
                  Routing.slideToPage(context, OrderSuccess());
                } catch(e) {
                  print("Error");
                  print(e);
                  OverlayLoader.unshowLoading();
                }
              },
              child: Container(
                height: 50,
                width: 50,
                color: Colors.red,
                child: Text(
                  "Order"
                )
              ),
            )
          ],
        )
      ),
    );
  }
}
