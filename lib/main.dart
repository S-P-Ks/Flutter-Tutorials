import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './home.dart';

void main(List<String> args) {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  // );
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
              subtitle1: TextStyle(fontFamily: "Quicksand"),
              subtitle2: TextStyle(fontFamily: "EduQLDBeginner"),
              headline2: TextStyle(fontFamily: "Quicksand"),
              headline4: TextStyle(fontFamily: "Quicksand"),
              headline1: TextStyle(fontFamily: "EduQLDBeginner"),
              headline3: TextStyle(fontFamily: "EduQLDBeginner"),
              headline5: TextStyle(fontFamily: "Roboto"),
              headline6: TextStyle(fontFamily: "Quicksand"),
              button: TextStyle(color: Colors.white),
            )),
        themeMode: ThemeMode.light,
        home: HomeScreen());
  }
}
