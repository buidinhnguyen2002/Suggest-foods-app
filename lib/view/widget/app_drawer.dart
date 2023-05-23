import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/view/screens/home_screen.dart';
import 'package:suggest_food_app/view/screens/manage_food_screen.dart';
import 'package:suggest_food_app/view/screens/manage_schedule_screen.dart';

import '../../provider/auth.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  // 2. Gọi hàm chuyến hướng sang trang ManageScheduleScreen
  void showManageScheduleScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(ManageScheduleScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: CircleAvatar(
                child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
              ),
              title: const Text(
                "Bùi Đình Nguyên",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            // 1. Hien thi chuc nang Quan ly mon an
            leading: const Icon(Icons.fastfood),
            title: const Text('Manage foods'),
            onTap: () {
              // 2. Chuyen huong sang trang chuc nang Manage Food
              Navigator.of(context).pushReplacementNamed(ManageFoodScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manage Schedules'),
            // 1. Nhấn nút ManageSchedule để chuyển hướng đến màn hình ManageScheduleScreen
            onTap: () => showManageScheduleScreen(
                context), // 2. Gọi hàm chuyến hướng sang trang ManageScheduleScreen
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
