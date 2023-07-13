import 'package:athens/model/food.dart';
import 'package:athens/service/skeleton/backend.dart';
import 'package:athens/service/skeleton/database.dart';
import 'package:flutter/material.dart';

class FoodService {
  Future<List<Food>> getFood(String restaurantId) async {
    return (await Database.getAll('restaurants/$restaurantId/food')).map((foodMap) {
      return Food.fromMap(foodMap);
    }).toList();
  }

  Future<List<Food>> getAllFood() async {
    return (await Database.getAllGroup('food')).map((foodMap) {
      return Food.fromMap(foodMap);
    }).toList();
  }

  static Future<void> buyFood(String restaurantId, String foodId) async {
    await Backend.post('buyFood', {
      'food_id': foodId,
      'restaurant_id': restaurantId
    });
  }
}