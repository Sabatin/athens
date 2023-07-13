import 'package:athens/model/food.dart';
import 'package:flutter/material.dart';

class FoodService {
  Future<List<Food>> getFood(String restaurantId) async {
    return [Food('pasta', 'pasta al sugo', 1000000000), Food('kebab', 'kebab buono', 2000), Food('pizza', 'con le patate', 2000000000000)];
  }

  Future<void> buyFood(String restaurantId, String foodId) async {

  }
}