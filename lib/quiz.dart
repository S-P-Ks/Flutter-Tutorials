import 'package:flutter/material.dart';
import 'package:flutter_tutorials/answer.dart';
import 'package:flutter_tutorials/questions.dart';
import 'package:flutter_tutorials/result.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _totalScore = 0;
  int _questionIndex = 0;

  void _selectAnswer(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex += 1;
      print(_questionIndex);
    });
  }

  void _restartGame() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  final _questions = const [
    {
      "questionText": "Who are you ?",
      "answers": [
        {"text": "Tiger", "score": 10},
        {"text": "Lion", "score": 8},
        {"text": "Cheetah", "score": 9},
        {"text": "Rabbit", "score": 7}
      ]
    },
    {
      "questionText": "What do you like ?",
      "answers": [
        {"text": "Tiger", "score": 10},
        {"text": "Lion", "score": 8},
        {"text": "Cheetah", "score": 9},
        {"text": "Rabbit", "score": 7}
      ]
    },
    {
      "questionText": "Whom do you want to become ?",
      "answers": [
        {"text": "Tiger", "score": 10},
        {"text": "Lion", "score": 8},
        {"text": "Cheetah", "score": 9},
        {"text": "Rabbit", "score": 7}
      ]
    },
    {
      "questionText": "What you dream of becoming?",
      "answers": [
        {"text": "Tiger", "score": 10},
        {"text": "Lion", "score": 8},
        {"text": "Cheetah", "score": 9},
        {"text": "Rabbit", "score": 7}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return _questionIndex < _questions.length
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Questions(_questions[_questionIndex]["questionText"] as String),
              ...(_questions[_questionIndex]["answers"]
                      as List<Map<String, Object>>)
                  .map((answer) => Answer(answer, _selectAnswer))
                  .toList()
            ],
          )
        : ResutlScreen(_totalScore, _restartGame);
  }
}
