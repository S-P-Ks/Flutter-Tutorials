import 'package:flutter/material.dart';
import 'package:flutter_tutorials/widgets/category_item.dart';
import '../dummy_dart.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map(
              (e) => CategoryItem(
                  categoryID: e.id, title: e.title, color: e.color),
            )
            .toList());
  }
}
