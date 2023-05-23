import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/controller/food_controller.dart';
import 'package:suggest_food_app/model/food.dart';
import 'package:suggest_food_app/model/recipe.dart';
import 'package:suggest_food_app/provider/food_data.dart';
import 'package:suggest_food_app/view/screens/food_detail_screen.dart';
import 'package:suggest_food_app/view/widget/food_item.dart';

class EditFoodScreen extends StatefulWidget {
  static const routeName = '/edit-food';
  const EditFoodScreen({super.key});

  @override
  State<EditFoodScreen> createState() => _EditFoodScreenState();
}

class _EditFoodScreenState extends State<EditFoodScreen> {
  final _form = GlobalKey<FormState>();
  String _name = '';
  String _description = '';
  String _category = '';
  String _urlImage = '';
  double _rate = 0.0;
  bool _favorite = false;
  Recipe _recipe = Recipe(ingredients: [], steps: []);

  final FoodController foodController = new FoodController();

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

  Future<void> _saveForm() async {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
    setFinalEditedFood();
    setState(() {
      _isLoading = true;
    });
    if (_editFood.id != '') {
      await foodController.updateFood(
          context, _editFood.id.toString(), _editFood);
    } else {
      try {
        await foodController.createFood(context, _editFood);
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
    // 3.1.6 Hiển thị trang Quản lý món ăn mới tạo món ăn mới
    // 3.2.6 Hiển thị trang Quản lý món ăn được cập nhật
    showFoodDetailScreen();
  }
  
  void showFoodDetailScreen() {
    Navigator.of(context).pushNamed(
      FoodDetailScreen.routeName,
      arguments: _editFood.id != ''
          ? _editFood.id
          : Provider.of<FoodData>(context, listen: false).food.last.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(_editFood.id != null ? 'Edit Food' : 'Create food'),
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
                      initialValue: _initValues['name'].toString(),
                      decoration: InputDecoration(labelText: 'Name'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value.';
                        }
                        // 3.1.4 Kiem tra ten da ton tai || 3.2.4 Kiem tra ten moi cap nhat da ton tai
                        if (Provider.of<FoodData>(context, listen: false).foodNameIsExist(value)) {
                          // 3.1.4.1.2 Tra ve da ton tai ten || 3.2.4.1.2 Tra ve ten moi cap nhat da ton tai
                          return 'Food name is exist';
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
                    TextFormField(
                      initialValue: _initValues['description'].toString(),
                      decoration: InputDecoration(labelText: 'Description'),
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
                          name: _editFood.name,
                          description: value,
                          category: _editFood.category,
                          urlImage: _editFood.urlImage,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['category'].toString(),
                      decoration: InputDecoration(labelText: 'Category'),
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
                          name: _editFood.name,
                          description: _editFood.description,
                          category: value,
                          urlImage: _editFood.urlImage,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['urlImage'].toString(),
                      decoration: InputDecoration(labelText: 'urlImage'),
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
                          name: _editFood.name,
                          description: _editFood.urlImage,
                          category: _editFood.category,
                          urlImage: value,
                        );
                      },
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
   void setFinalEditedFood() {
    _editFood = Food(
      id: _initValues['id'].toString() == ''
          ? ''
          : _initValues['id'].toString(),
      name: _editFood.name,
      description: _editFood.description,
      rate: 0.0,
      category: _editFood.category,
      urlImage: _editFood.urlImage,
      favorite: false,
      recipe: _recipe,
    );
  }

}
