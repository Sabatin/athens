import 'package:athens/model/restaurant.dart';
import 'package:athens/screens/restaurants/restaurant_card.dart';
import 'package:athens/service/restaurants.dart';
import 'package:flutter/material.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(title: Text("ye")),
            Expanded(
              child: FutureBuilder<List<Restaurant>>(
                future: RestaurantsService().getRestaurants(),
                builder: (context, restaurants) {
                  if (restaurants.hasData) {
                    return ListView.separated(
                      itemCount: restaurants.requireData.length,
                      itemBuilder: (context, index) {
                        return RestaurantCard(restaurants.requireData[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 30);
                      },
                    );
                  }
                  else if (restaurants.hasError) {
                    return Text("Error");
                  }
                  return SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator());
                }
              ),
            ),
          ],
        )
      ),
    );
  }
}
