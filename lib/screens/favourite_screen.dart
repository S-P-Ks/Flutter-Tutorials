import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
          child: Text("You have no favorites yet - start adding one."));
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) => MeanItem(
              id: favoriteMeals[index].id,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration,
              imageUrl: favoriteMeals[index].imageUrl,
              title: favoriteMeals[index].title,
            )),
        itemCount: favoriteMeals.length,
      );
    }
  }
}
