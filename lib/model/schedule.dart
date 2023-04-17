import 'food.dart';

class Schedule {
  final String? title;
  final DateTime? applyDate;
  final List<Food>? foods;
  final bool? isChoose;
  Schedule({this.title, this.applyDate, this.foods, this.isChoose = false});
}
