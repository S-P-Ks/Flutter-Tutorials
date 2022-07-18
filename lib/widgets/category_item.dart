import 'package:flutter/material.dart';
import 'package:flutter_tutorials/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String categoryID;

  const CategoryItem(
      {Key? key,
      required this.categoryID,
      required this.title,
      required this.color})
      : super(key: key);

  void selectCategory(BuildContext ctx) {
    print(title);
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {"id": categoryID, "categoryTitle": title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
