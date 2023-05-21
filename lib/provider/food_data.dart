import 'package:flutter/cupertino.dart';
import 'package:suggest_food_app/model/ingredient.dart';
import 'package:suggest_food_app/model/recipe.dart';

import '../model/food.dart';

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
  List<Food> get foods {
    return [..._foodFavorite];
  }

  Food getFoodById(String id) {
    return _foodFavorite.firstWhere((food) => food.id == id);
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
}
