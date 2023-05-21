import 'package:flutter/cupertino.dart';
import 'package:suggest_food_app/model/schedule.dart';
import 'package:suggest_food_app/provider/schedule_data.dart';
import 'package:provider/provider.dart';

class ScheduleController {
  ScheduleController();
  //3.6.1 Gọi hàm addSchedule trong ScheduleData để tạo lịch
  Future<void> createSchedule(BuildContext context, Schedule schedule) async {
    await Provider.of<ScheduleData>(context, listen: false)
        .addSchedule(schedule);
  }

  // 4.6.1 Gọi hàm updateSchedule trong ScheduleData để cập nhật lịch
  Future<void> updateSchedule(
      BuildContext context, String id, Schedule schedule) async {
    await Provider.of<ScheduleData>(context, listen: false)
        .updateSchedule(id, schedule);
  }

  // 5.1.2.2 xóa lịch
  Future<void> deleteSchedule(BuildContext context, String id) async {
    await Provider.of<ScheduleData>(context, listen: false).deleteSchedule(id);
  }

  // 3.4.1 gọi phương thức scheduleNameIsExist để kiểm tra xem tên đã tồn tại hay chưa || 4.4.1 gọi phương thức scheduleNameIsExist để kiểm tra xem tên đã tồn tại chưa
  bool checkScheduleName(BuildContext context, name) {
    return Provider.of<ScheduleData>(context, listen: false)
        .scheduleNameIsExist(name);
  }
}
