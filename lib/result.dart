import 'package:flutter/material.dart';

class ResutlScreen extends StatelessWidget {
  int _totalScore;
  VoidCallback restartGame;
  ResutlScreen(this._totalScore, this.restartGame);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
