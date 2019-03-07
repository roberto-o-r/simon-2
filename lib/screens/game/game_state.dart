import 'dart:ui';

import 'package:simon_2/util/simon_colors.dart';

class GameState {}

class GameStatePlay extends GameState {
  List game = new List<int>();
  List check = new List<int>();
  int _score = 0;
  bool _locked = false;
  String _message = "";
  Color _green = SimonColors.green;
  Color _red = SimonColors.red;
  Color _yellow = SimonColors.yellow;
  Color _blue = SimonColors.blue;

  GameStatePlay();

  factory GameStatePlay.initial() => GameStatePlay();
}

class GameStateAnimate extends GameState {}
