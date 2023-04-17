import 'package:flutter/material.dart';

class CardSchedule extends StatelessWidget {
  const CardSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.3,
      constraints: BoxConstraints(maxHeight: deviceSize.height * 0.3),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.green.shade300,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: const Text(
              'Track your eating schedule',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                height: 1.4,
                fontSize: 30,
              ),
            ),
            trailing: Transform(
              transform: Matrix4.translationValues(0, 40, 0),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(
                      left: 20, right: 0, top: 10, bottom: 10),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => {},
                child: Container(
                  width: 115,
                  child: Row(
                    children: [
                      Text(
                        'View now',
                        style: TextStyle(
                          color: Colors.green.shade300,
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.green.shade300,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
