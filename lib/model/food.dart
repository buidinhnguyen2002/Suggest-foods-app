import 'package:suggest_food_app/model/recipe.dart';

class Food {
  final String? id;
  final String? name;
  final String? description;
  final double? rate;
  final String? category;
  final String? urlImage;
  late final bool? favorite;
  final Recipe? recipe;
  final bool? isChoose;

  Food({
    this.id,
    this.name,
    this.description,
    this.rate,
    this.category,
    this.urlImage,
    this.favorite = false,
    this.recipe,
    this.isChoose = false,
  });
}
