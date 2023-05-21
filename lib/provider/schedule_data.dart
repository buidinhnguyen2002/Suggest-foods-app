import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:suggest_food_app/model/food.dart';
import 'package:suggest_food_app/model/ingredient.dart';
import 'package:suggest_food_app/model/recipe.dart';
import 'package:suggest_food_app/provider/dummy.dart';
import 'package:suggest_food_app/util/constants.dart';
import '../model/http_exception.dart';
import '../model/schedule.dart';
import 'package:http/http.dart' as http;

class ScheduleData with ChangeNotifier {
  List<Schedule> _schedules = [
    Schedule(
      id: '1',
      title: 'Bình thường',
      applyDate: DateTime.now(),
      foods: [],
      isChoose: false,
    ),
    Schedule(
      id: '2',
      title: 'Bình thường',
      applyDate: DateTime.now(),
      foods: [],
      isChoose: false,
    ),
    Schedule(
      id: '3',
      title: 'Bình thường',
      applyDate: DateTime.now(),
      foods: [],
      isChoose: false,
    ),
    Schedule(
      id: '4',
      title: 'Bình thường',
      applyDate: DateTime.now(),
      foods: [],
      isChoose: false,
    ),
    Schedule(
      id: '5',
      title: 'Bình thường',
      applyDate: DateTime.now(),
      foods: [],
      isChoose: true,
    ),
  ];
  final String? authToken;
  final String? userId;
  ScheduleData(this._schedules, {this.authToken, this.userId});
  List<Schedule> get schedules {
    return [..._schedules];
  }

  bool scheduleNameIsExist(name) {
    for (var schedule in schedules) {
      if (schedule.title == name) return true;
    }
    return false;
  }

  Future<void> fetchAndSetSchedule() async {
    var url = '$apiSchedules$userId.json?auth=$authToken';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Schedule> loadedSchedules = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((scheduleId, scheduleData) {
        loadedSchedules.add(
          Schedule(
            id: scheduleId,
            isChoose: scheduleData['isChoose'],
            title: scheduleData['title'],
            applyDate: DateTime.parse(scheduleData['applyDate']),
            foods: (scheduleData['foods'] as List<dynamic>)
                .map(
                  (food) => Food(
                    id: food['id'],
                    category: food['category'],
                    description: food['description'],
                    favorite: food['favorite'],
                    name: food['name'],
                    rate: food['rate'],
                    urlImage: food['urlImage'],
                    recipe: Recipe(
                      ingredients:
                          (food['recipe']['ingredients'] as List<dynamic>)
                              .map(
                                (ingredient) => Ingredient(
                                  ingredient['name'],
                                  ingredient['price'],
                                ),
                              )
                              .toList(),
                      steps: (food['recipe']['steps'] as List<dynamic>)
                          .map(
                            (step) => step.toString(),
                          )
                          .toList(),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      });
      _schedules = loadedSchedules;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Schedule findById(String id) {
    return _schedules.firstWhere((schedule) => schedule.id == id);
  }

  Future<void> updateSchedule(String id, Schedule newSchedule) async {
    final scheduleIndex =
        _schedules.indexWhere((schedule) => schedule.id == id);
    if (scheduleIndex > -1) {
      final url = '$apiSchedules$userId/$id.json?auth=$authToken';
      await http.patch(Uri.parse(url),
          body: json.encode({
            'title': newSchedule.title,
            'applyDate': newSchedule.applyDate?.toIso8601String(),
            'foods': newSchedule.foods!
                .map((food) => {
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
                    })
                .toList(),
            'isChoose': newSchedule.isChoose,
          }));
      _schedules[scheduleIndex] = newSchedule;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteSchedule(String id) async {
    final url = '$apiSchedules$userId/$id.json?auth=$authToken';
    final existingScheduleIndex =
        _schedules.indexWhere((schedule) => schedule.id == id);
    Schedule? existingSchedule = _schedules[existingScheduleIndex];
    _schedules.removeAt(existingScheduleIndex);
    notifyListeners();
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode >= 400) {
      _schedules.insert(existingScheduleIndex, existingSchedule);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
  }

  Future<void> addSchedule(Schedule schedule) async {
    final url = '$apiSchedules$userId.json?auth=$authToken';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'title': schedule.title,
          'applyDate': schedule.applyDate?.toIso8601String(),
          'foods': schedule.foods!
              .map((food) => {
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
                  })
              .toList(),
          'isChoose': schedule.isChoose,
          'creatorId': userId,
        }),
      );
      final newSchedule = Schedule(
          id: json.decode(response.body)['name'],
          title: schedule.title,
          applyDate: schedule.applyDate,
          foods: schedule.foods,
          isChoose: schedule.isChoose);
      _schedules.add(newSchedule);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
