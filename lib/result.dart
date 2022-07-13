import 'package:flutter/material.dart';

class ResutlScreen extends StatelessWidget {
  final int _totalScore;
  VoidCallback restartGame;
  ResutlScreen(this._totalScore, this.restartGame, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Your score is $_totalScore"),
          InkWell(
            onTap: restartGame,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Restart Game"),
            ),
          )
        ],
      ),
    );
  }
}
