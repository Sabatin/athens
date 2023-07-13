import 'package:athens/model/food.dart';
import 'package:athens/service/skeleton/database.dart';
import 'package:flutter/material.dart';

class FoodService {
  Future<List<Food>> getFood(String restaurantId) async {
    return (await Database.getAll('restaurants/$restaurantId/food')).map((foodMap) {
      return Food.fromMap(foodMap);
    }).toList();
  }

  Future<void> buyFood(String restaurantId, String foodId) async {

  }
}