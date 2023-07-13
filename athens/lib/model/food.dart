import 'package:athens/service/skeleton/database.dart';

import 'restaurant.dart';

class Food {
  late final String name;
  late final String description;
  late final int price;
  late final String id;
  late final String restaurantId;
  late int reward;
  late final String category;

  Restaurant? restaurant = null;


  Food.fromMap(Map<String, dynamic> foodMap) {
    name = foodMap['name'];
    description = foodMap['description'];
    price = foodMap['price'];
    id = foodMap['id'];
    category = foodMap['category'];
    restaurantId = foodMap['restaurant_id'];
    reward = foodMap['reward'];
    reward = 0;
  }

  Future<void> getRestaurant() async {
    restaurant = Restaurant.fromMap(await Database.get('restaurants', 'restaurantId'));
  }
}
