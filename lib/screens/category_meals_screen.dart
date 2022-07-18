import 'package:flutter/material.dart';
import 'package:flutter_tutorials/dummy_dart.dart';
import 'package:flutter_tutorials/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "category-meals";
  final List<Meal> avalableMeals;

  CategoryMealsScreen(this.avalableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;

  void _removeItem(String mealId) {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeData["categoryTitle"] as String;
    final id = routeData["id"];

    displayedMeals = widget.avalableMeals
        .where((element) => element.categories.contains(id))
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeals(mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) => MeanItem(
              id: displayedMeals[index].id,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
              imageUrl: displayedMeals[index].imageUrl,
              title: displayedMeals[index].title,
            )),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
