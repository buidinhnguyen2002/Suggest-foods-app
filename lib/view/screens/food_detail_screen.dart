import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/provider/food_data.dart';
import 'package:suggest_food_app/view/widget/card_food_detail.dart';

class FoodDetailScreen extends StatelessWidget {
  static const routeName = '/food-detail';
  const FoodDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final deviceSize = MediaQuery.of(context).size;
    final food = Provider.of<FoodData>(context, listen: false)
        .findById(id as String);
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name!),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemBuilder: (context, index) => CardFoodDetail(
            id: food.id,
          ),
          // itemCount: food!.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
