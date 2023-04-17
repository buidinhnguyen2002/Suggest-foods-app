import 'package:flutter/material.dart';

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
      ),
    );
  }
}
