import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
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
  final _titleFocusNode = FocusNode();
  final _applyDateFocusNode = FocusNode();
  final _foodsFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  DateTime? _selectedDate;
  Map<String, bool> foodsItem = {};

  Map<String, bool> fillMapFoods() {
    final foods = Provider.of<FoodData>(context, listen: false).foods;
    for (var food in foods) {
      foodsItem.putIfAbsent(food.id!, () => false);
    }
    print(foodsItem);
    return foodsItem;
  }

  void setStatusFoods(String id, bool newValue) {
    foodsItem[id] = newValue;
    print("alo");
    print(foodsItem);
  }

  var _editSchedule = Schedule(
    title: '',
    applyDate: null,
    foods: [],
  );
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  var _isInit = true;
  var _initValues = {
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
      }
      fillMapFoods();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _form.currentState?.save();
    setState(() {
      _isLoading = true;
    });
    if (_editSchedule.id != '') {
      await Provider.of<ScheduleData>(context, listen: false)
          .updateSchedule(_editSchedule.id!, _editSchedule);
    } else {
      try {
        await Provider.of<ScheduleData>(context, listen: false)
            .addProduct(_editSchedule);
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
      // finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }
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
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
      setState(() {
        _selectedDate = pickedDate!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final foods = Provider.of<FoodData>(context, listen: false).foods;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: Icon(Icons.save),
          )
        ],
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
                      onFieldSubmitted: (_) {
                        // FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
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
                      height: 300,
                      child: ListView.builder(
                        itemBuilder: (context, index) => FoodItem(
                          updateStatusItem: setStatusFoods,
                          id: foods[index].id,
                          category: foods[index].category,
                          name: foods[index].name,
                          rate: foods[index].rate,
                          urlImage: foods[index].urlImage,
                        ),
                        itemCount: foods.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
