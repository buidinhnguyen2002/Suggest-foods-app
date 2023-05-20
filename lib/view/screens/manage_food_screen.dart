import 'package:flutter/material.dart';
import 'package:suggest_food_app/view/widget/app_drawer.dart';

class ManageFoodScreen extends StatelessWidget {
  static const routeName = '/manage-food';
  const ManageFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: Text('Foods'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(EditScheduleScreen.routeName);
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
      // body: FutureBuilder(
        // future: _refreshSchedules(context),
        // builder: (context, snapshot) => snapshot.connectionState ==
        //         ConnectionState.waiting
        //     ? const Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     : Consumer<ScheduleData>(
        //         builder: (context, scheduleData, child) => Container(
        //           color: Colors.white,
        //           width: deviceSize.width,
        //           height: deviceSize.height,
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //           child: ListView.builder(
        //             itemBuilder: (context, index) => ScheduleItem(
        //               id: scheduleData.schedules[index].id,
        //               isChoose: scheduleData.schedules[index].isChoose as bool,
        //               applyDate: scheduleData.schedules[index].applyDate,
        //               name: scheduleData.schedules[index].title,
        //             ),
        //             itemCount: scheduleData.schedules.length,
        //           ),
        //         ),
        //       ),
      // ),
    );
  }
}
