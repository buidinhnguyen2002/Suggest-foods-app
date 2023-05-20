import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/model/food.dart';
import 'package:suggest_food_app/provider/food_data.dart';

class FoodController {
  FoodController();
  Future<void> createFood(BuildContext context, Food food) async {
    await Provider.of<FoodData>(context, listen: false).addFood(food);
  }
}