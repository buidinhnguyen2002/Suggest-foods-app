import 'dart:ffi';

import 'package:flutter/material.dart';

class FoodItem extends StatefulWidget {
  final void Function(String, bool) updateStatusItem;
  const FoodItem({super.key, required this.updateStatusItem});

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  bool isChoose = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChoose,
      onChanged: (value) {
        setState(() {
          isChoose = !isChoose;
        });
        widget.updateStatusItem('1', isChoose);
      },
      // widget.isChoose = !widget.isChoose
      activeColor: Theme.of(context).primaryColor,
      checkColor: Theme.of(context).accentColor,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        'Hello',
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      subtitle: Text("alo"),
      contentPadding: const EdgeInsets.all(0),
      tristate: true,
      secondary: Container(
        width: 96,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              style: IconButton.styleFrom(
                padding: EdgeInsets.all(0),
              ),
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    title: Text("Delete"),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    children: [
                      const Text('Are you sure you want to delete schedules?'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Delete successful!',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
