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
    if (event is StartGame) {
      yield* _startGame();
    }
    if (event is SimonPlay) {
      yield currentState.copyWith(game: _simonPlay(currentState));
    }
  }

  Stream<GameState> _startGame() async* {
    // Show initial message.
    yield currentState.copyWith(message: "Ready?");
    await _simonWait(1000);
    yield currentState.copyWith(message: "Go!");
    await _simonWait(1000);
    yield currentState.copyWith(message: "");

    // Start game by first Simon move.
    this.dispatch(SimonPlay());
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

  Future _simonWait([int miliseconds = 500]) async {
    await Future.delayed(Duration(milliseconds: miliseconds));
  }
}
