import 'food.dart';

class Schedule {
  final String? id;
  final String? title;
  final DateTime? applyDate;
  final List<Food>? foods;
  final bool? isChoose;
  Schedule(
      {this.id, this.title, this.applyDate, this.foods, this.isChoose = false});
}
