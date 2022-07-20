import 'package:flutter/material.dart';
import 'package:flutter_tutorials/dummy_dart.dart';
import 'package:flutter_tutorials/models/meal.dart';
import 'package:flutter_tutorials/screens/categories_screen.dart';
import 'package:flutter_tutorials/screens/category_meals_screen.dart';
import 'package:flutter_tutorials/home.dart';
import 'package:flutter_tutorials/screens/filter_screen.dart';
import 'package:flutter_tutorials/screens/meal_detail_screen.dart';
import 'package:flutter_tutorials/screens/tabs_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> _filters) {
    setState(() {
      filters = _filters;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filters["gluten"] as bool && !meal.isGlutenFree) {
          return false;
        }

        if (filters["lactose"] as bool && !meal.isLactoseFree) {
          return false;
        }

        if (filters["vegan"] as bool && !meal.isVegan) {
          return false;
        }

        if (filters["vegetarian"] as bool && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => mealId == element.id);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isMealFavorite(String mealId) {
    return _favoriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: const TextStyle(
                fontSize: 24,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        "/": (context) => TabScreen(favoriteMeals: _favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, isMealFavorite: isMealFavorite),
        FilterScreen.routeName: (context) =>
            FilterScreen(filters: filters, changeState: _setFilters),
      },
    );
  }
}
