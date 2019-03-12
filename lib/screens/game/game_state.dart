class GameState {
  final List<int> game;

  const GameState({this.game});

  factory GameState.initial() => GameState(game: List<int>());
}
