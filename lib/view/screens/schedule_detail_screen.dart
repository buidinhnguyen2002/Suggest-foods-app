import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/provider/schedule_data.dart';
import 'package:suggest_food_app/view/widget/card_food_detail.dart';

class ScheduleDetailScreen extends StatelessWidget {
  static const routeName = '/schedule-detail';
  const ScheduleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final deviceSize = MediaQuery.of(context).size;
    final schedule = Provider.of<ScheduleData>(context, listen: false)
        .findById(id as String);
    return Scaffold(
      appBar: AppBar(
        title: Text(schedule.title!),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemBuilder: (context, index) => CardFoodDetail(
            id: schedule.foods![index].id,
          ),
          itemCount: schedule.foods!.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
