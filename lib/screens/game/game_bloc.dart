import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:bloc/bloc.dart';
import 'package:simon_2/screens/game/game_event.dart';
import 'package:simon_2/screens/game/game_state.dart';

class CounterBloc extends Bloc<GameEvent, GameState> {
  Timer _countdown;
  AudioCache _player1 = new AudioCache(prefix: 'sounds/');
  AudioCache _player2 = new AudioCache(prefix: 'sounds/');
  AudioCache _player3 = new AudioCache(prefix: 'sounds/');
  AudioCache _player4 = new AudioCache(prefix: 'sounds/');

  CounterBloc() {
    // Load sounds.
    _player1.load('classic-1.mp3');
    _player2.load('classic-2.mp3');
    _player3.load('classic-3.mp3');
    _player4.load('classic-4.mp3');
  }

  @override
  GameState get initialState => GameState.initial();

  @override
  Stream<GameState> mapEventToState(
      GameState currentState, GameEvent event) async* {
    if (event is StartGame) {
      yield* _startGame();
    } else if (event is SimonPlay) {
      _simonPlay();
    } else if (event is UserPlay) {
      yield* _userPlay(event);
    } else if (event is GameOver) {
      yield* _gameOver();
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

  Stream<GameState> _userPlay(UserPlay event) async* {
    // Reset countdown.
    _countdown.cancel();

    // Verify user movement.
    if (currentState.check.first == event.number) {
      _playSound(event.number);
      currentState.check.removeAt(0);
      if (currentState.check.isEmpty) {
        // User has completed all the movements. It's Simon's turn.
        yield currentState.copyWith(score: currentState.score + 1);
        this.dispatch(SimonPlay());
      } else {
        // Restart countdown.
        _startCountDown();
      }
    } else {
      // Game over.
      this.dispatch(GameOver());
    }
  }

  Stream<GameState> _gameOver() async* {
    _countdown.cancel();
    yield currentState.copyWith(locked: true, message: "Game Over");
    _playSound(5);
  }

  Stream<GameState> _animateGame() async* {
    // Lock user's movements.
    yield currentState.copyWith(locked: true);

    await _simonWait();

    // Light movements.
    for (int n in currentState.game) {
      yield currentState.copyWith(toggled: n);

      _playSound(n);

      await _simonWait();

      yield currentState.copyWith(toggled: 0);

      await _simonWait();
    }

    yield currentState.copyWith(locked: false);

    // Restart countdown.
    _startCountDown();
  }

  void _playSound(int number) {
    switch (number) {
      case 1:
        _player1.play('classic-1.mp3');
        break;
      case 2:
        _player2.play('classic-2.mp3');
        break;
      case 3:
        _player3.play('classic-3.mp3');
        break;
      case 4:
        _player4.play('classic-4.mp3');
        break;
      default:
        _player1.play('classic-1.mp3');
        _player2.play('classic-2.mp3');
        _player3.play('classic-3.mp3');
        _player4.play('classic-4.mp3');
    }
  }

  void _startCountDown() {
    _countdown = new Timer(
        Duration(milliseconds: 5000), () => {this.dispatch(GameOver())});
  }

  Future _simonWait([int miliseconds = 500]) async {
    await Future.delayed(Duration(milliseconds: miliseconds));
  }
}
