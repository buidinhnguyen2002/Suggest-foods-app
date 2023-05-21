import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/model/food.dart';
import 'package:suggest_food_app/provider/food_data.dart';
import 'package:suggest_food_app/view/widget/food_item.dart';

class EditFoodScreen extends StatefulWidget {
  static const routeName = '/edit-food';
  const EditFoodScreen({super.key});

  @override
  State<EditFoodScreen> createState() => _EditFoodScreenState();
}

class _EditFoodScreenState extends State<EditFoodScreen> {
  final _form = GlobalKey<FormState>();
  late String _name;
  late String _description;
  late double _rate;
  late String _category;
  late String _urlImage;
  Map<String, bool> foodsItem = {};

  Map<String, bool> fillMapFoods(List<Food> foodsChoose) {
    final foods = Provider.of<FoodData>(context, listen: false).foodFavorites;
    for (var food in foods) {
      foodsItem.putIfAbsent(food.id!, () => containFood(foodsChoose, food));
    }
    return foodsItem;
  }
  List<String> get getIdFoodsChoose {
    List<String> result = [];
    foodsItem.forEach((key, value) {
      if (value) result.add(key);
    });

    return result;
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
  var _initValues = {
    'id': '',
    'name': '',
    'description': '',
    'rate': null,
    'category': '',
    'urlImage': '',
    'favorite': false,
    'recipe': '',
  };
  var _editFood = Food(
    name: '',
    description: '',
    category: '',
    urlImage: '',
  );

  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final foods = Provider.of<FoodData>(context, listen: false).foodFavorites;
    final List<Food> foodsChoose =
        (_initValues['foods'] as List<dynamic>).isNotEmpty
            ? _initValues['foods'] as List<Food>
            : [];
    fillMapFoods(foodsChoose);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _editFood.id != null ? 'Edit Food' : 'Create food'),
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
                      decoration: InputDecoration(labelText: 'Titlele'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editFood = Food(
                          id: _editFood.id,
                          name: value,
                          description: _editFood.description,
                          category: _editFood.category,
                          urlImage: _editFood.urlImage,
                          
                        );
                      },
                    ),
                    // Container(
                    //   height: 70,
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: Text(_selectedDate == null
                    //             ? 'No date chosen!'
                    //             : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
                    //       ),
                    //       TextButton(
                    //         onPressed: _presentDatePicker,
                    //         child: Text('Choose Date'),
                    //       ),
                    //     ],
                    //   ),
                    // ),
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
                          // updateStatusItem: setStatusFoods,
                          id: foods[index].id,
                          category: foods[index].category,
                          name: foods[index].name,
                          rate: foods[index].rate,
                          urlImage: foods[index].urlImage,
                          isChoose: containFood(foodsChoose, foods[index])
                              ? true
                              : false, 
                          updateStatusItem: (String , bool ) {  },
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
                        _editFood.id != null ? 'Update' : 'Create',
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

  void _saveForm() {}
  }
}