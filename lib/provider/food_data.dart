import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:suggest_food_app/model/ingredient.dart';
import 'package:suggest_food_app/model/recipe.dart';
import 'package:suggest_food_app/provider/dummy.dart';
import 'package:suggest_food_app/util/constants.dart';

import '../model/food.dart';
import 'package:http/http.dart' as http;

class FoodData with ChangeNotifier {
  final List<Food> _foodFavorite = [
    Food(
      id: '1',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
      recipe: Recipe(ingredients: [
        Ingredient('Ca chep', 10),
        Ingredient('Ot', 2),
        Ingredient('Hanh', 1),
      ], steps: [
        'Step1',
        'Step2',
        'Step3',
        'Step4',
      ]),
    ),
    Food(
      id: '2',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
      recipe: Recipe(ingredients: [
        Ingredient('Ca chep', 10),
        Ingredient('Ot', 2),
        Ingredient('Hanh', 1),
      ], steps: [
        'Step1',
        'Step2',
        'Step3',
        'Step4',
      ]),
    ),
    Food(
      id: '3',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
      recipe: Recipe(ingredients: [
        Ingredient('Ca chep', 10),
        Ingredient('Ot', 2),
        Ingredient('Hanh', 1),
      ], steps: [
        'Step1',
        'Step2',
        'Step3',
        'Step4',
      ]),
    ),
    Food(
      id: '4',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
      recipe: Recipe(ingredients: [
        Ingredient('Ca chep', 10),
        Ingredient('Ot', 2),
        Ingredient('Hanh', 1),
      ], steps: [
        'Step1',
        'Step2',
        'Step3',
        'Step4',
      ]),
    ),
    Food(
      id: '5',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
      recipe: Recipe(ingredients: [
        Ingredient('Ca chep', 10),
        Ingredient('Ot', 2),
        Ingredient('Hanh', 1),
      ], steps: [
        'Step1',
        'Step2',
        'Step3',
        'Step4',
      ]),
    ),
    Food(
      id: '6',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
      recipe: Recipe(ingredients: [
        Ingredient('Ca chep', 10),
        Ingredient('Ot', 2),
        Ingredient('Hanh', 1),
      ], steps: [
        'Step1',
        'Step2',
        'Step3',
        'Step4',
      ]),
    ),
  ];
  List<Food> get foodFavorites {
    return [..._foodFavorite];
  }

  List<Food> getFoodsByIds(List<String> ids) {
    List<Food> result = [];
    ids.forEach((id) {
      _foodFavorite.forEach((food) {
        if (food.id == id) {
          result.add(food);
        }
      });
    });
    return result;
  }
  List<Food> _food = [];

  final String? authToken;
  final String? userId;
  FoodData(List<Food> _food, {this.authToken, this.userId});

  Future<void> addFood(Food food) async {
    final url = '$apiFoods$userId.json?auth=$authToken';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'id': food.id,
          'name': food.name,
          'description': food.description,
          'rate': food.rate,
          'category': food.category,
          'urlImage': food.urlImage,
          'favorite': food.favorite,
          'recipe': {
            'ingredients': food.recipe!.ingredients!
              .map((ingredient) => {
                'name': ingredient.name,
                'price': ingredient.price,
                }).toList(),
                'steps': food.recipe?.steps!
                  .map((step) => {
                    'step': step,
                    }).toList(),
             },
        }),
      );
      final newFood = Food(
        id: food.id,
        description: food.description,
        rate: food.rate,
        category: food.category,
        urlImage: food.urlImage,
        favorite: food.favorite,
        recipe: food.recipe,
      )
      _food.add(newFood);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateFood(String id, Food food) async {

  }
}
