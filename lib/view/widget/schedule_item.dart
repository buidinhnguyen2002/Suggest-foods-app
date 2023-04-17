import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScheduleItem extends StatefulWidget {
  bool isChoose;
  String? name;
  DateTime? applyDate;
  ScheduleItem({super.key, required this.isChoose, this.name, this.applyDate});

  @override
  State<ScheduleItem> createState() => _ScheduleItemState();
}

class _ScheduleItemState extends State<ScheduleItem> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.isChoose,
      onChanged: (value) => setState(() {
        widget.isChoose = !widget.isChoose;
      }),
      activeColor: Theme.of(context).primaryColor,
      checkColor: Theme.of(context).accentColor,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(widget.name!),
      subtitle: Text(widget.applyDate.toString()),
    );
  }
}
