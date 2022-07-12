import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  String questionText;
  Questions(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Text(
      questionText,
      style: TextStyle(fontSize: 20),
    );
  }
}
