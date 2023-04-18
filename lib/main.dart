import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/controller/schedule_controller.dart';
import 'package:suggest_food_app/provider/auth.dart';
import 'package:suggest_food_app/provider/food_data.dart';
import 'package:suggest_food_app/provider/schedule_data.dart';
import 'package:suggest_food_app/view/screens/edit_schedule_screen.dart';
import 'package:suggest_food_app/view/screens/home_screen.dart';
import 'package:suggest_food_app/view/screens/auth_screen.dart';
import 'package:suggest_food_app/view/screens/manage_schedule_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ScheduleData(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => FoodData(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, child) => MaterialApp(
          title: 'My demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
            primaryColor: Colors.green,
            accentColor: Colors.white,
          ),
          home: auth.isAuth ? HomeScreen() : AuthScreen(),
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            ManageScheduleScreen.routeName: (context) => ManageScheduleScreen(),
            EditScheduleScreen.routeName: (context) => EditScheduleScreen(),
          },
        ),
      ),
    );
  }
}
