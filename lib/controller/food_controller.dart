import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/model/food.dart';
import 'package:suggest_food_app/provider/food_data.dart';

class FoodController {
  FoodController();
  Future<void> createFood(BuildContext context, Food food) async {
    await Provider.of<FoodData>(context, listen: false).addFood(food);
  }
  Future<void> updateFood(BuildContext context, String id, Food food) async {
    await Provider.of<FoodData>(context, listen: false).updateFood(id, food);
  }
  Future<void> deleteFood(BuildContext context, String id) async {
    await Provider.of<FoodData>(context, listen: false).deleteFood(id);
  }
}