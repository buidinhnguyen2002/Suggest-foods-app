import 'package:flutter/material.dart';
import 'package:suggest_food_app/provider/dummy.dart';
import 'package:suggest_food_app/view/widget/schedule_item.dart';

import '../widget/app_drawer.dart';

class ManageScheduleScreen extends StatelessWidget {
  static const routeName = '/manage-schedule';
  const ManageScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: Text('Home'),
      ),
      body: Container(
        color: Colors.white,
        width: deviceSize.width,
        height: deviceSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemBuilder: (context, index) => ScheduleItem(
            isChoose: schedules[index].isChoose as bool,
            applyDate: schedules[index].applyDate,
            name: schedules[index].title,
          ),
          itemCount: schedules.length,
        ),
      ),
    );
  }
}
