import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/controller/schedule_controller.dart';
import 'package:suggest_food_app/model/food.dart';
import 'package:suggest_food_app/model/schedule.dart';
import 'package:suggest_food_app/provider/food_data.dart';
import 'package:suggest_food_app/provider/schedule_data.dart';
import 'package:suggest_food_app/view/widget/food_item.dart';

class EditScheduleScreen extends StatefulWidget {
  static const routeName = '/edit-schedule';
  const EditScheduleScreen({super.key});

  @override
  State<EditScheduleScreen> createState() => _EditScheduleScreenState();
}

class _EditScheduleScreenState extends State<EditScheduleScreen> {
  final _form = GlobalKey<FormState>();
  DateTime? _selectedDate;
  Map<String, bool> foodsItem = {};
  int count = 0;
  final ScheduleController scheduleController = ScheduleController();
  Map<String, bool> fillMapFoods(List<Food> foodsChoose) {
    final foods = Provider.of<FoodData>(context, listen: false).foods;
    for (var food in foods) {
      foodsItem.putIfAbsent(food.id!, () => containFood(foodsChoose, food));
    }
    return foodsItem;
  }

  int get getFoodsTic {
    foodsItem.forEach((key, value) {
      if (value) count++;
    });

    return count;
  }

  List<String> get getIdFoodsChoose {
    List<String> result = [];
    foodsItem.forEach((key, value) {
      if (value) result.add(key);
    });

    return result;
  }

  void setStatusFoods(String id, bool newValue) {
    foodsItem[id] = newValue;
  }

  var _editSchedule = Schedule(
    title: '',
    applyDate: null,
    foods: [],
  );
  @override
  void dispose() {
    super.dispose();
  }

  var _isInit = true;
  var _initValues = {
    'id': '',
    'title': '',
    'applyDate': null,
    'foods': [],
    'isChoose': null,
  };
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final scheduleId = ModalRoute.of(context)!.settings.arguments;
      if (scheduleId != null) {
        _editSchedule = Provider.of<ScheduleData>(context, listen: false)
            .findById(scheduleId as String);
        _initValues = {
          'id': _editSchedule.id,
          'title': _editSchedule.title!,
          'applyDate': _editSchedule.applyDate!,
          'foods': _editSchedule.foods!,
          'isChoose': _editSchedule.isChoose,
        };
        _selectedDate = _editSchedule.applyDate!;
        count = _editSchedule.foods!.length;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void setFinalEditedSchedule() {
    _editSchedule = Schedule(
      id: _initValues['id'].toString() == ''
          ? ''
          : _initValues['id'].toString(),
      applyDate: _selectedDate,
      foods: Provider.of<FoodData>(context, listen: false)
          .getFoodsByIds(getIdFoodsChoose),
      isChoose: _editSchedule.isChoose,
      title: _editSchedule.title,
    );
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState?.validate();
    if (!isValid! || _selectedDate == null || getFoodsTic < 3) {
      return;
    }
    _form.currentState?.save();
    setFinalEditedSchedule();
    setState(() {
      _isLoading = true;
    });
    if (_editSchedule.id != '') {
      await scheduleController.updateSchedule(
          context, _editSchedule.id.toString(), _editSchedule);
    } else {
      try {
        await scheduleController.createSchedule(context, _editSchedule);
      } catch (error) {
        await showDialog<void>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('An error occurred'),
            content: const Text('Something went wrong.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text('Okay'),
              ),
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
      setState(() {
        if (pickedDate != null) _selectedDate = pickedDate;
      });
    });
  }

  bool containFood(List<Food> foodsContain, Food food) {
    for (var f in foodsContain) {
      if (f.id == food.id) {
        return true;
      }
    }
    for (var id in getIdFoodsChoose) {
      if (id == food.id) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final foods = Provider.of<FoodData>(context, listen: false).foods;
    final List<Food> foodsChoose =
        (_initValues['foods'] as List<dynamic>).isNotEmpty
            ? _initValues['foods'] as List<Food>
            : [];
    fillMapFoods(foodsChoose);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _editSchedule.id != null ? 'Edit Schedule' : 'Create schedule'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _initValues['title'].toString(),
                      decoration: InputDecoration(labelText: 'Titile'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editSchedule = Schedule(
                          id: _editSchedule.id,
                          applyDate: _editSchedule.applyDate,
                          foods: _editSchedule.foods,
                          isChoose: _editSchedule.isChoose,
                          title: value,
                        );
                      },
                    ),
                    Container(
                      height: 70,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(_selectedDate == null
                                ? 'No date chosen!'
                                : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
                          ),
                          TextButton(
                            onPressed: _presentDatePicker,
                            child: Text('Choose Date'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: deviceSize.height - 70 - 16 * 2 - 20 - 200,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: const Offset(0, 2),
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        itemBuilder: (context, index) => FoodItem(
                          updateStatusItem: setStatusFoods,
                          id: foods[index].id,
                          category: foods[index].category,
                          name: foods[index].name,
                          rate: foods[index].rate,
                          urlImage: foods[index].urlImage,
                          isChoose: containFood(foodsChoose, foods[index])
                              ? true
                              : false,
                        ),
                        itemCount: foods.length,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: _saveForm,
                      child: Text(
                        _editSchedule.id != null ? 'Update' : 'Create',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
