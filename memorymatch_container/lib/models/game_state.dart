import 'memory_card.dart';

enum GameDifficulty {
  easy,
  medium,
  hard
}

class GameState {
  final List<MemoryCard> cards;
  final int moves;
  final int matches;
  final int secondsElapsed;
  final bool isGameComplete;
  final GameDifficulty difficulty;

  GameState({
    required this.cards,
    this.moves = 0,
    this.matches = 0,
    this.secondsElapsed = 0,
    this.isGameComplete = false,
    this.difficulty = GameDifficulty.easy,
  });

  GameState copyWith({
    List<MemoryCard>? cards,
    int? moves,
    int? matches,
    int? secondsElapsed,
    bool? isGameComplete,
    GameDifficulty? difficulty,
  }) {
    return GameState(
      cards: cards ?? this.cards,
      moves: moves ?? this.moves,
      matches: matches ?? this.matches,
      secondsElapsed: secondsElapsed ?? this.secondsElapsed,
      isGameComplete: isGameComplete ?? this.isGameComplete,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}
