import 'package:flutter/material.dart';
import 'package:flutter_tutorials/models/meal.dart';
import 'package:flutter_tutorials/screens/categories_screen.dart';
import 'package:flutter_tutorials/screens/favourite_screen.dart';
import 'package:flutter_tutorials/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  TabScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var _selectedIndex = 0;
  late List<Map<String, Object>> _pages;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {"page": CategoriesScreen(), "title": "Category"},
      {
        "page": FavScreen(favoriteMeals: widget.favoriteMeals),
        "title": "Favorite"
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meals"),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: "Category",
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: "Favorite",
            )
          ]),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedIndex]["page"] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: "Favorite",
            ),
          ],
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}
