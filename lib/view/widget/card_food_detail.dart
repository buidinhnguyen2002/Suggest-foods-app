import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/provider/food_data.dart';

class CardFoodDetail extends StatelessWidget {
  final String? id;
  const CardFoodDetail({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final food = Provider.of<FoodData>(context).getFoodById(id!);
    return Container(
      width: deviceSize.width - 40,
      height: deviceSize.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(food.urlImage!, fit: BoxFit.cover),
          ListTile(
            title: Text(food.name!),
            subtitle: Text(food.category!),
            trailing: Container(
              width: 50,
              child: Row(
                children: [
                  Text(
                    '${food.rate}',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description: ${food.description}',
                    ),
                    Text('Ingredients: '),
                    Container(
                      // height: deviceSize.height * 0.2,
                      constraints: BoxConstraints(
                        maxHeight: deviceSize.height * 0.2,
                      ),
                      child: ListView.builder(
                        itemBuilder: (context, index) => Container(
                          width: deviceSize.width - 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(food.recipe!.ingredients![index].name
                                  .toString()),
                              Text(
                                  '\$ ${food.recipe!.ingredients![index].price.toString()}'),
                            ],
                          ),
                        ),
                        itemCount: food.recipe!.ingredients!.length,
                      ),
                    ),
                    Text('Steps: '),
                    Container(
                      // height: deviceSize.height * 0.2,
                      constraints: BoxConstraints(
                        maxHeight: deviceSize.height * 0.2,
                      ),
                      child: ListView.builder(
                        itemBuilder: (context, index) => Container(
                          width: deviceSize.width - 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Step $index :'),
                              Text(food.recipe!.steps![index].toString()),
                            ],
                          ),
                        ),
                        itemCount: food.recipe!.ingredients!.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
