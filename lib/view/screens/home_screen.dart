import 'dart:math';

import 'package:flutter/material.dart';
import 'package:suggest_food_app/view/widget/app_drawer.dart';
import 'package:suggest_food_app/view/widget/bottom_navigationbar_item.dart'
    as BottomNavigationBarItem;
import 'package:suggest_food_app/view/widget/card_schedule.dart';
import 'package:suggest_food_app/view/widget/food_favorite_slide.dart';
import '../../util/constants.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CardSchedule(),
            Text(
              'My menu today',
              style: TextStyle(
                color: Color.fromARGB(255, 145, 199, 136),
                fontWeight: FontWeight.w600,
                fontSize: 25,
                height: 1.4,
              ),
              textAlign: TextAlign.left,
            ),
            FoodFavoriteSlide(),
          ],
        ),
      ),
    );
  }
}
