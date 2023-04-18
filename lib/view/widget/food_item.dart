import 'dart:ffi';

import 'package:flutter/material.dart';

class FoodItem extends StatefulWidget {
  final void Function(String, bool) updateStatusItem;
  final String? id;
  final String? name;
  final String? category;
  final String? urlImage;
  final double? rate;
  const FoodItem(
      {super.key,
      required this.updateStatusItem,
      this.id,
      this.name,
      this.category,
      this.urlImage,
      this.rate});

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
        widget.updateStatusItem(widget.id!, isChoose);
      },
      activeColor: Theme.of(context).primaryColor,
      checkColor: Theme.of(context).accentColor,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        widget.name!,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      subtitle: Text(widget.category!),
      contentPadding: const EdgeInsets.all(0),
      tristate: true,
      secondary: Image.network(widget.urlImage!),
    );
  }
}
