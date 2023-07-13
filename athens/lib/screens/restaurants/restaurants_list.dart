import 'package:athens/model/restaurant.dart';
import 'package:athens/screens/restaurants/restaurant_card.dart';
import 'package:athens/service/restaurants_service.dart';
import 'package:flutter/material.dart';

class RestaurantsList extends StatelessWidget {
  RestaurantsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Restaurant>>(
      future: RestaurantsService().getRestaurants(),
      builder: (context, restaurants) {
        if (restaurants.hasData) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: restaurants.requireData.length,
            itemBuilder: (context, index) {
              return RestaurantCard(restaurants.requireData[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
          );
        } else if (restaurants.hasError) {
          return Text("Error");
        }
        return SizedBox(
            height: 20, width: 20, child: CircularProgressIndicator());
      },
    );
  }
}
