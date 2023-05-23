import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:suggest_food_app/model/http_exception.dart';
import 'package:suggest_food_app/model/ingredient.dart';
import 'package:suggest_food_app/model/recipe.dart';
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

  List<Food> _food = [
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
      name: 'Bún chả',
      category: 'Món Việt Nam',
      description:
          'Bún chả là một món ăn truyền thống Việt Nam, thường được chế biến từ thịt lợn và được dùng kèm với bún, rau thơm và nước chấm',
      rate: 5.0,
      urlImage:
          'https://caogiang.vn/wp-content/uploads/2022/12/315268217_590419939703944_5572954831738823471_n-e1669970806325.jpg',
      recipe: Recipe(ingredients: [
        Ingredient('Bún', 10),
        Ingredient('Chả', 5),
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
      name: 'Bắp rang bơ',
      category: 'Món ăn vặt',
      description:
          'Bắp rang bơ là món ăn vặt phổ biến tại các rạp chiếu phim và quán ăn nhanh, với bắp tươi rang chín và được phủ lớp bơ, chút muối và tiêu để tạo ra một hương vị thơm ngon',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/2021/04/CookProduct/Untitled-1-1200x676-8.jpg',
      recipe: Recipe(ingredients: [
        Ingredient('Bap', 10),
        Ingredient('Bo', 2),
        Ingredient('Gia vi: socola, caramel', 1),
      ], steps: [
        'Step1',
        'Step2',
        'Step3',
        'Step4',
      ]),
    ),
    Food(
      id: '4',
      name: 'Sushi',
      category: 'Món ăn Nhật Bản',
      description:
          'Sushi là món ăn Nhật Bản truyền thống, làm từ gạo nếp, tỏi, rong biển và thức ăn như cá, tôm, hoặc cua. Sushi có một hình dạng đẹp mắt và thường được ăn với nước tương và gừng đắng',
      rate: 5.0,
      urlImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Sushi_platter.jpg/800px-Sushi_platter.jpg',
      recipe: Recipe(ingredients: [
        Ingredient('Thành phần chính: Gạo nếp, rong biển', 10),
        Ingredient('Thức ăn: cá hồi, tôm, cua', 2),
        Ingredient('Gia vị: Tỏi, hành, nước tương', 1),
      ], steps: [
        'Step1',
        'Step2',
        'Step3',
        'Step4',
      ]),
    ),
    Food(
      id: '5',
      name: 'Pizza Margherita',
      category: 'Pizza',
      description:
          'Pizza Margherita là loại pizza cổ điển nguyên chất của Ý Ý với số ít thành phần: xốt cà chua, phô mai Mozzarella tươi, thơm cùng với lá húng quế.',
      rate: 5.0,
      urlImage:
          'https://file.hstatic.net/1000389344/file/margherita_24fb21d879184ef68c1ebb2faa9af975_grande.jpg',
      recipe: Recipe(ingredients: [
        Ingredient('Bột mì', 10),
        Ingredient('xốt cà chua', 2),
        Ingredient('phô mai Mozzarella tươi', 1),
        Ingredient('lá húng quế', 1),
      ], steps: [
        'Step1',
        'Step2',
        'Step3',
        'Step4',
      ]),
    ),
  ];

  final String? authToken;
  final String? userId;
  FoodData(List<Food> _food, {this.authToken, this.userId});

  List<Food> get food {
    return [..._food];
  }

  String get fid{
    return [..._food].length.toString();
  }

  Future<void> fetchAndSetFood() async {
    var url = '$apiFoods$userId.json?auth=$authToken';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Food> loadedFoods = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((foodId, foodData) {
        loadedFoods.add(
          Food(
            id: foodId,
            name: foodData['name'],
            category: foodData['category'],
            description: foodData['description'],
            favorite: foodData['favorite'],
            urlImage: foodData['urlImage'],
            recipe: Recipe(
              ingredients: (foodData['recipe']['ingredients'] as List<dynamic>)
                  .map(
                    (ingredient) => Ingredient(
                      ingredient['name'],
                      ingredient['price'],
                    ),
                  )
                  .toList(),
              steps: (foodData['recipe']['steps'] as List<dynamic>)
                  .map(
                    (step) => step.toString(),
                  )
                  .toList(),
            ),
          ),
        );
      });
      _food = loadedFoods;
      notifyListeners();
    } catch (e) {}
  }

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
                    })
                .toList(),
            'steps': food.recipe?.steps!
                .map((step) => {
                      'step': step,
                    })
                .toList(),
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
      );
      _food.add(newFood);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateFood(String id, Food newFood) async {
    final foodIndex = _food.indexWhere((food) => food.id == id);
    if (foodIndex > -1) {
      final url = '$apiFoods/$id.json?auth=$authToken';
      await http.patch(Uri.parse(url),
          body: json.encode({
            "name": newFood.name,
            'description': newFood.description,
            'rate': newFood.rate,
            'category': newFood.category,
            'urlImage': newFood.urlImage,
            'favorite': newFood.favorite,
            'recipe': {
            'ingredients': newFood.recipe!.ingredients!
                .map((ingredient) => {
                      'name': ingredient.name,
                      'price': ingredient.price,
                    })
                .toList(),
            'steps': newFood.recipe?.steps!
                .map((step) => {
                      'step': step,
                    })
                .toList(),
          },
          }));
      _food[foodIndex] = newFood;
      notifyListeners();
    }
  }
  // 3.3.2 ham xoa mon an
  Future<void> deleteFood(String id) async {
    final url = '$apiFoods$userId/$id.json?auth=$authToken';
    final existingFoodIndex = _food.indexWhere((food) => food.id == id);
    Food? existingFood = _food[existingFoodIndex];
    _food.removeAt(existingFoodIndex);
    notifyListeners();
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode >= 400) {
      _food.insert(existingFoodIndex, existingFood);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
  }

  //3.4.1 cap nhat trang thai yeu thich
  Future<void> updateFavoriteStatus(String id, bool newFavoriteStatus) async {
    final foodIndex = _food.indexWhere((food) => food.id == id);
    if (foodIndex >= 0) {
      _food[foodIndex].favorite = newFavoriteStatus;
      notifyListeners();
    }
  }

  Food findById(String id) {
    return _food.firstWhere((food) => food.id == id);
  }
  // 3.1.4.1 kiem tra ten tao mon an moi da ton tai chua || 3.2.4.1 kiem tra ten cap nhat moi ton tai chua
  bool foodNameIsExist(name) {
    for (var f in food) {
      if (f.name == name) return true;
    }
    return false;
  }
}
