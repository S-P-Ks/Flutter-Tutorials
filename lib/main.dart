import 'package:flutter/material.dart';
import "package:flutter_tutorials/form.dart";

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
      home: FormScreen(),
    );
  }
}
