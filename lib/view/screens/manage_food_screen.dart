import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest_food_app/provider/food_data.dart';
import 'package:suggest_food_app/view/screens/edit_food_screen.dart';
import 'package:suggest_food_app/view/widget/app_drawer.dart';
import 'package:suggest_food_app/view/widget/food_favorite_slide.dart';
import 'package:suggest_food_app/view/widget/food_item.dart';

class ManageFoodScreen extends StatelessWidget {
  static const routeName = '/manage-food';
  const ManageFoodScreen({super.key});
  Future<void> _refreshFoods(BuildContext context) async {
    await Provider.of<FoodData>(context, listen: false).fetchAndSetFood();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          centerTitle: true,
          title: const Text('My foods'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditFoodScreen.routeName);
              },
              icon: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'List'),
              Tab(text: 'Favorite'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: _refreshFoods(context),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Consumer<FoodData>(
                          builder: (context, foodData, child) => Container(
                            color: Colors.white,
                            width: deviceSize.width,
                            height: deviceSize.height,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: ListView.builder(
                              itemBuilder: (context, index) => FoodItem(
                                id: foodData.fid,
                                name: foodData.food[index].name,
                                category: foodData.food[index].category,
                                urlImage: foodData.food[index].urlImage,
                                isChoose: foodData.food[index].isChoose as bool,
                                updateStatusItem: (id, isChoose) {
                                  foodData.updateFavoriteStatus(id, isChoose);
                                },
                              ),
                              itemCount: foodData.food.length,
                            ),
                          ),
                        ),
            ),
            FutureBuilder(
              future: _refreshFoods(context),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Consumer<FoodData>(
                          builder: (context, foodData, child) => Container(
                            color: Colors.white,
                            width: deviceSize.width,
                            height: deviceSize.height,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                final foodItem = foodData.food[index];
                                if (foodItem.favorite == true) {
                                  return FoodItem(
                                    id: foodItem.id,
                                    name: foodItem.name,
                                    category: foodItem.category,
                                    urlImage: foodItem.urlImage,
                                    isChoose: foodItem.isChoose as bool,
                                    updateStatusItem: (id, isChoose) {
                                      foodData.updateFavoriteStatus(id, isChoose);
                                    },
                                  );
                                }
                              },
                              itemCount: foodData.food.length,
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
