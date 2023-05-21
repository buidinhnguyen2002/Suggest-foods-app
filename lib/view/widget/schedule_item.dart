import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/provider/schedule_data.dart';
import 'package:suggest_food_app/view/screens/edit_schedule_screen.dart';
import 'package:suggest_food_app/view/screens/schedule_detail_screen.dart';

import '../../controller/schedule_controller.dart';

class ScheduleItem extends StatefulWidget {
  String? id;
  bool isChoose;
  String? name;
  DateTime? applyDate;

  ScheduleItem(
      {super.key, this.id, required this.isChoose, this.name, this.applyDate});

  @override
  State<ScheduleItem> createState() => _ScheduleItemState();
}

class _ScheduleItemState extends State<ScheduleItem> {
  final ScheduleController scheduleController = ScheduleController();
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
    Navigator.of(context).pop();
  }

  // 4.1 Gọi hàm showEditSchedule để hiển thị trang EditScheduleScreen
  void showEditScheduleScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamed(EditScheduleScreen.routeName, arguments: widget.id);
  }

  void cancleDialog() {
    Navigator.of(context).pop();
  }

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
      title: TextButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(ScheduleDetailScreen.routeName, arguments: widget.id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name!,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.applyDate.toString(),
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
      // subtitle: Text(widget.applyDate.toString()),
      contentPadding: const EdgeInsets.all(0),
      tristate: true,
      secondary: Container(
        width: 96,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              // 4. Nhấn icon cây bút chì bên phải của lịch để chuyển đến trang EditScheduleScreen
              padding: EdgeInsets.all(0),
              style: IconButton.styleFrom(
                padding: EdgeInsets.all(0),
              ),
              // 4.1 Gọi hàm showEditSchedule để hiển thị trang EditScheduleScreen thực hiện chỉnh sửa lịch
              onPressed: () => showEditScheduleScreen(context),
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              // 5. Nhấn icon xọt rác màu đỏ bên phải của lịch trong trang ManageScheduleScreen
              onPressed: () {
                // 5.1 hiển thị hộp thoại
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
                            // 5.1.1 nhấn nút no trên hộp thoại hiện ra
                            onPressed: () {
                              // 5.1.1.1 Hủy bỏ hiển thị hộp thoại
                              cancleDialog();
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                            // 5.1.2 nhấn nút yes
                            onPressed: () async {
                              try {
                                await scheduleController
                                    .deleteSchedule(
                                        // 5.1.2.1 Gọi controller xóa lịch
                                        context,
                                        widget.id!)
                                    .then((_) => showSnackBar(
                                        context, 'Deleting successful'));
                              } catch (e) {
                                showSnackBar(context, 'Deleting failed!');
                              }
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
