class GameState {
  final List<int> game;
  final String message;
  final bool animate;

  const GameState({this.game, this.message, this.animate});

  factory GameState.initial() =>
      GameState(game: List<int>(), message: "", animate: false);

  GameState copyWith({
    List<int> game,
    String message,
    bool animate,
  }) {
    return GameState(
      game: game ?? this.game,
      message: message ?? this.message,
      animate: animate ?? this.animate,
    );
  }
}
