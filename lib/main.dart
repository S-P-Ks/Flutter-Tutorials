import 'package:flutter/material.dart';
import 'package:flutter_tutorials/home.dart';
import 'package:flutter_tutorials/login.dart';
import 'package:flutter_tutorials/Product.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Form",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomeScreen(),
      routes: {
        "/login": ((context) => LoginScreen()),
        "/home": (context) {
          return HomeScreen();
        },
        "/product": (context) {
          return ProductScreen();
        }
      },
    );
  }
}
