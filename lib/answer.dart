import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Map<String, Object> answer;
  final Function selectAnswer;

  Answer(this.answer, this.selectAnswer);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => selectAnswer(answer["score"]),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            answer["text"] as String,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  toList() {}
}
