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
              try {
                OverlayLoader.showLoading(context);
                await FoodService.buyFood(food);
                OverlayLoader.unshowLoading();
                Routing.slideToPage(context, OrderSuccess());
              } catch(e) {
                OverlayLoader.unshowLoading();
                print(e);
              }
            },
            child: Container(height: 50, width: 50, child: Text("Order")),
          )
        ],
      )),
    );
  }
}
