import 'package:flutter/material.dart';
import 'package:suggest_food_app/view/widget/card_food_item.dart';
import '../../provider/dummy_food_favorite.dart';

class FoodFavoriteSlide extends StatelessWidget {
  const FoodFavoriteSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.3 + 30,
      constraints: BoxConstraints(maxHeight: deviceSize.height * 0.3 + 30),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.builder(
        itemBuilder: (context, index) => CardFoodItem(
          id: foodFavorite[index].id,
          category: foodFavorite[index].category,
          description: foodFavorite[index].description,
          name: foodFavorite[index].name,
          rate: foodFavorite[index].rate,
          urlImage: foodFavorite[index].urlImage.toString(),
        ),
        itemCount: foodFavorite.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
