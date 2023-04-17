import 'package:flutter/material.dart';

class BottomNavigationBarItem extends StatelessWidget {
  final String? urlIcon;
  const BottomNavigationBarItem({super.key, this.urlIcon});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {},
      child: Container(
        child: Image.asset(urlIcon!),
      ),
    );
  }
}
