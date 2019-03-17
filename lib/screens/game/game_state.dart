class GameState {
  final List<int> game;
  final List<int> check;
  final String message;
  final bool locked;
  final bool over;
  final int toggled;
  final int score;

  const GameState(
      {this.game,
      this.check,
      this.message,
      this.locked,
      this.over,
      this.toggled,
      this.score});

  factory GameState.initial() => GameState(
      game: List<int>(),
      check: List<int>(),
      message: "",
      locked: false,
      over: false,
      toggled: 0,
      score: 0);

  GameState copyWith({
    List<int> game,
    List<int> check,
    String message,
    bool locked,
    bool over,
    int toggled,
    int score,
  }) {
    return GameState(
      game: game ?? this.game,
      check: check ?? this.check,
      message: message ?? this.message,
      locked: locked ?? this.locked,
      over: over ?? this.over,
      toggled: toggled ?? this.toggled,
      score: score ?? this.score,
    );
  }
}
