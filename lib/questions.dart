import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  String questionText;
  Questions(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      questionText,
      style: const TextStyle(fontSize: 20),
    );
  }
}
