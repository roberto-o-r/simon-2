abstract class GameEvent {}

class StartGame extends GameEvent {}

class SimonPlay extends GameEvent {}

class UserPlay extends GameEvent {
  int number;

  UserPlay(this.number);
}

class AnimateGame extends GameEvent {}

class GameOver extends GameEvent {}
