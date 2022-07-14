import 'package:flutter/material.dart';
import './home.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Tip Calculator",
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: Colors.red)),
            textTheme: const TextTheme(
                headline2: TextStyle(fontFamily: "Quicksand"),
                headline4: TextStyle(fontFamily: "Quicksand"),
                headline1: TextStyle(fontFamily: "EduQLDBeginner"),
                headline3: TextStyle(fontFamily: "EduQLDBeginner"),
                headline5: TextStyle(fontFamily: "Roboto"),
                headline6: TextStyle(fontFamily: "Quicksand"))),
        themeMode: ThemeMode.light,
        home: HomeScreen());
  }
}
