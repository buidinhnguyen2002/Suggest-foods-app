import 'package:flutter/material.dart';
import 'package:suggest_food_app/controller/schedule_controller.dart';
import 'package:suggest_food_app/view/screens/edit_schedule_screen.dart';
import '../../provider/schedule_data.dart';
import 'package:suggest_food_app/view/widget/schedule_item.dart';
import 'package:provider/provider.dart';
import '../widget/app_drawer.dart';

class ManageScheduleScreen extends StatelessWidget {
  static const routeName = '/manage-schedule';
  // final ScheduleController scheduleController = ScheduleController();

  const ManageScheduleScreen({super.key});
  Future<void> _refreshSchedules(BuildContext context) async {
    await Provider.of<ScheduleData>(context, listen: false)
        .fetchAndSetSchedule();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: Text('My schedules'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditScheduleScreen.routeName);
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: FutureBuilder(
        future: _refreshSchedules(context),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<ScheduleData>(
                builder: (context, scheduleData, child) => Container(
                  color: Colors.white,
                  width: deviceSize.width,
                  height: deviceSize.height,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListView.builder(
                    itemBuilder: (context, index) => ScheduleItem(
                      id: scheduleData.schedules[index].id,
                      isChoose: scheduleData.schedules[index].isChoose as bool,
                      applyDate: scheduleData.schedules[index].applyDate,
                      name: scheduleData.schedules[index].title,
                    ),
                    itemCount: scheduleData.schedules.length,
                  ),
                ),
              ),
      ),
    );
  }
}
