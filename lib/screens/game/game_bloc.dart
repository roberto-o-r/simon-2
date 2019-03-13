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
    } else if (event is SimonPlay) {
      _simonPlay();
    } else if (event is AnimateGame) {
      yield* _animateGame();
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

  void _simonPlay() {
    // Simon makes a new move.
    var rnd = new Random();
    var number = 1 + rnd.nextInt(4);
    currentState.game.add(number);
    currentState.check.clear();
    currentState.check.addAll(currentState.game);

    // Animate game movements so far.
    this.dispatch(AnimateGame());
  }

  Stream<GameState> _animateGame() async* {
    // Lock user's movements.
    yield currentState.copyWith(locked: true);

    await _simonWait();

    // Light movements.
    for (int n in currentState.game) {
      yield currentState.copyWith(toggled: n);

      //TODO: playsound.

      await _simonWait();

      yield currentState.copyWith(toggled: 0);

      await _simonWait();
    }

    yield currentState.copyWith(locked: false);

    //TODO: Start countdown.
  }

  Future _simonWait([int miliseconds = 500]) async {
    await Future.delayed(Duration(milliseconds: miliseconds));
  }
}
