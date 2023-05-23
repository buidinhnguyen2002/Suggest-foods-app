import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/model/food.dart';
import 'package:suggest_food_app/provider/food_data.dart';

class FoodController {
  FoodController();
  // 3.1.5 tao mot mon an
  Future<void> createFood(BuildContext context, Food food) async {
    await Provider.of<FoodData>(context, listen: false).addFood(food);
  }
  // 3.2.5 cap nhat danh sach
  Future<void> updateFood(BuildContext context, String id, Food food) async {
    await Provider.of<FoodData>(context, listen: false).updateFood(id, food);
  }
  // 3.3.2 xoa mon an
  Future<void> deleteFood(BuildContext context, String id) async {
    await Provider.of<FoodData>(context, listen: false).deleteFood(id);
  }
  // 3.1.4.1 goi foodNameIsExist kiem tra ten ton tai khong
  bool checkFoodName(BuildContext context, name) {
    return Provider.of<FoodData>(context, listen: false)
        .foodNameIsExist(name);
  }
}