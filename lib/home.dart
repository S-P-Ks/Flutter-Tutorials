import 'package:flutter/material.dart';
import './screens/categories_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoriesScreen(),
    );
  }
}
