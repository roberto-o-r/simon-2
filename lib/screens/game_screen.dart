import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simon_2/util/simon_colors.dart';

class GameScreen extends StatefulWidget {
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List game = new List<int>();
  List check = new List<int>();
  int _score = 0;

  void _startGame() {
    _simonPlay();
  }

  void _simonPlay() {
    var rnd = new Random();
    var number = 1 + rnd.nextInt(4);
    game.add(number);
    check.clear();
    check.addAll(game);

    for (int n in game) {
      print("Simon:" + n.toString());
    }
  }

  void _userPlay(int number) {
    print("User:" + number.toString());

    if (check.first == number) {
      check.removeAt(0);
      if (check.isEmpty) {
        setState(() {
          _score++;
          _simonPlay();
        });
      }
    } else {
      print("Game Over");
    }
  }

  @override
  void initState() {
    // Start a new game.
    _startGame();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Padding(
                padding: EdgeInsets.only(left: 8, top: 8, right: 4, bottom: 4),
                child: RaisedButton(
                  color: SimonColors.green,
                  onPressed: () {
                    _userPlay(1);
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Padding(
                padding: EdgeInsets.only(left: 4, top: 8, right: 8, bottom: 4),
                child: RaisedButton(
                  color: SimonColors.red,
                  onPressed: () {
                    _userPlay(2);
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Padding(
                padding: EdgeInsets.only(left: 8, top: 4, right: 4, bottom: 8),
                child: RaisedButton(
                  color: SimonColors.yellow,
                  onPressed: () {
                    _userPlay(3);
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Padding(
                padding: EdgeInsets.only(left: 4, top: 4, right: 8, bottom: 8),
                child: RaisedButton(
                  color: SimonColors.blue,
                  onPressed: () {
                    _userPlay(4);
                  },
                ),
              ),
            ),
          ),
          Center(
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: SimonColors.translucent),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    _score.toString(),
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
