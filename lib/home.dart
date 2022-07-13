import 'package:flutter/material.dart';
import 'package:flutter_tutorials/quiz.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz App")),
      body: const Center(
        child: QuizScreen(),
      ),
    );
  }
}
