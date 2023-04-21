import 'package:flutter/cupertino.dart';
import 'package:suggest_food_app/model/schedule.dart';
import 'package:suggest_food_app/provider/schedule_data.dart';
import 'package:provider/provider.dart';

class ScheduleController {
  ScheduleController();
  Future<void> createSchedule(BuildContext context, Schedule schedule) async {
    await Provider.of<ScheduleData>(context, listen: false)
        .addSchedule(schedule);
  }

  Future<void> updateSchedule(
      BuildContext context, String id, Schedule schedule) async {
    await Provider.of<ScheduleData>(context, listen: false)
        .updateSchedule(id, schedule);
  }

  Future<void> deleteSchedule(BuildContext context, String id) async {
    await Provider.of<ScheduleData>(context, listen: false).deleteSchedule(id);
  }
}
