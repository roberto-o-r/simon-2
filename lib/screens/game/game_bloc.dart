import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:simon_2/screens/game/game_event.dart';
import 'package:simon_2/screens/game/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  @override
  GameState get initialState => GameStatePlay.initial();

  @override
  Stream<GameState> mapEventToState(
      GameState currentState, GameEvent event) async* {
    if (event is UserPlayEvent) {
    } else if (event is SimonPlayEvent) {
      _simonPlay(currentState);
      yield GameStateAnimate();
    }
  }

  void _simonPlay(GameStatePlay currentState) {
    // Simon makes a new move.
    var rnd = new Random();
    var number = 1 + rnd.nextInt(4);
    currentState.game.add(number);
    currentState.check.clear();
    currentState.check.addAll(currentState.game);
  }
}
