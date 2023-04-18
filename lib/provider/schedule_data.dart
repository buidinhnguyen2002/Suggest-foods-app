import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:suggest_food_app/provider/dummy.dart';
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
  ScheduleData({this.authToken, this.userId});
  List<Schedule> get schedules {
    return [..._schedules];
  }

  Schedule findById(String id) {
    return _schedules.firstWhere((schedule) => schedule.id == id);
  }

  Future<void> updateSchedule(String id, Schedule newSchedule) async {
    final scheduleIndex =
        _schedules.indexWhere((schedule) => schedule.id == id);
    if (scheduleIndex > -1) {
      final url = '';
      await http.patch(Uri.parse(url),
          body: json.encode({
            'title': newSchedule.title,
            'applyDate': newSchedule.applyDate,
            'foods': newSchedule.foods,
            'isChoose': newSchedule.isChoose,
          }));
      _schedules[scheduleIndex] = newSchedule;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> addProduct(Schedule schedule) async {
    final url =
        'https://suggest-food-app-default-rtdb.firebaseio.com/schedules.json?auth=$authToken';
    try {
      final response = await http.post(
        Uri.parse(url),
        // body: json.encode({
        //   'title': schedule.title,
        //   'description': schedule.applyDate,
        //   'foods': schedule.foods,
        //   'isChoose': schedule.isChoose,
        //   'creatorId': userId,
        // }),
        body: json.encode({
          'title': 'Bình thường',
          'description': DateTime.now(),
          'foods': [],
          'isChoose': false,
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
