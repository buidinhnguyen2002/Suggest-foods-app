import 'package:suggest_food_app/model/ingredient.dart';

class Recipe {
  final List<Ingredient>? ingredients;
  final List<String>? steps;
  Recipe({this.ingredients, this.steps});
}
