import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:simon_2/screens/game/game_event.dart';
import 'package:simon_2/screens/game/game_state.dart';

class CounterBloc extends Bloc<GameEvent, GameState> {
  @override
  GameState get initialState => GameState.initial();

  @override
  Stream<GameState> mapEventToState(
      GameState currentState, GameEvent event) async* {
    if (event is SimonPlay) {
      yield GameState(game: _simonPlay(currentState));
    }
  }

  List<int> _simonPlay(GameState currentState) {
    // Get current game.
    var game = currentState.game;
    // Simon makes a new move.
    var rnd = new Random();
    var number = 1 + rnd.nextInt(4);
    game.add(number);
    //check.clear();
    //check.addAll(game);

    // Animate game movements so far.
    //_animateGame();
    return game;
  }
}
