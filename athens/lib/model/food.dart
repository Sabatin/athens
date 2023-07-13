import 'package:athens/service/skeleton/database.dart';

import 'restaurant.dart';

class Food {
  late final String name;
  late final String description;
  late final int price;
  late final String id;
  late final String restaurantId;
  late int reward;

  Restaurant? restaurant = null;

  Food(this.name, this.description, this.price) {
    id = '';
    restaurantId = '';
    reward = 0;
  }
  Food.fromMap(Map<String, dynamic> foodMap) {
    name = foodMap['name'];
    description = foodMap['description'];
    price = foodMap['price'];
    id = foodMap['id'];
    reward = foodMap['reward'];
  }

  Future<void> getRestaurant() async {
    restaurant = Restaurant.fromMap(await Database.get('restaurants', 'restaurantId'));
  }
}