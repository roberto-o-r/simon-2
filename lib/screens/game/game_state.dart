class GameState {
  final List<int> game;
  final List<int> check;
  final String message;
  final bool animate;

  const GameState({this.game, this.check, this.message, this.animate});

  factory GameState.initial() => GameState(
      game: List<int>(), check: List<int>(), message: "", animate: false);

  GameState copyWith({
    List<int> game,
    List<int> check,
    String message,
    bool animate,
  }) {
    return GameState(
      game: game ?? this.game,
      check: check ?? this.check,
      message: message ?? this.message,
      animate: animate ?? this.animate,
    );
  }
}
