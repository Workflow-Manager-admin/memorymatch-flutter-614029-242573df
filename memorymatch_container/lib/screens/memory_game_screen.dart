import 'dart:async';
import 'package:flutter/material.dart';
import '../models/game_state.dart';
import '../models/memory_card.dart';
import '../widgets/game_board.dart';
import '../widgets/game_header.dart';
import '../widgets/game_controls.dart';

class MemoryGameScreen extends StatefulWidget {
  const MemoryGameScreen({super.key});

  @override
  State<MemoryGameScreen> createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  late GameState gameState = GameState(
    cards: _generateCards(GameDifficulty.easy),
    difficulty: GameDifficulty.easy,
  );
  Timer? gameTimer;
  List<int> flippedCardIndexes = [];

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }

  void initializeGame() {
    final difficulty = gameState.difficulty;
    final cards = _generateCards(difficulty);
    setState(() {
      gameState = GameState(cards: cards);
      flippedCardIndexes = [];
    });
    startTimer();
  }

  void startTimer() {
    gameTimer?.cancel();
    gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!gameState.isGameComplete) {
        setState(() {
          gameState = gameState.copyWith(
            secondsElapsed: gameState.secondsElapsed + 1,
          );
        });
      }
    });
  }

  List<MemoryCard> _generateCards(GameDifficulty difficulty) {
    final int pairCount = switch (difficulty) {
      GameDifficulty.easy => 6,
      GameDifficulty.medium => 8,
      GameDifficulty.hard => 10,
    };

    final List<IconData> icons = [
      Icons.favorite,
      Icons.star,
      Icons.music_note,
      Icons.photo_camera,
      Icons.directions_car,
      Icons.local_florist,
      Icons.pets,
      Icons.local_pizza,
      Icons.sports_basketball,
      Icons.emoji_emotions,
    ];

    List<MemoryCard> cards = [];
    for (int i = 0; i < pairCount; i++) {
      cards.add(MemoryCard(id: i, icon: icons[i]));
      cards.add(MemoryCard(id: i, icon: icons[i]));
    }

    cards.shuffle();
    return cards;
  }

  void onCardTap(int index) {
    if (flippedCardIndexes.length == 2 || 
        gameState.cards[index].isFlipped || 
        gameState.cards[index].isMatched) {
      return;
    }

    setState(() {
      gameState = gameState.copyWith(
        cards: List.from(gameState.cards)..[index] = gameState.cards[index].copyWith(isFlipped: true),
        moves: gameState.moves + 1,
      );
      flippedCardIndexes.add(index);
    });

    if (flippedCardIndexes.length == 2) {
      _checkMatch();
    }
  }

  void _checkMatch() {
    final card1 = gameState.cards[flippedCardIndexes[0]];
    final card2 = gameState.cards[flippedCardIndexes[1]];

    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        if (card1.id == card2.id) {
          gameState = gameState.copyWith(
            cards: List.from(gameState.cards)
              ..[flippedCardIndexes[0]] = card1.copyWith(isMatched: true)
              ..[flippedCardIndexes[1]] = card2.copyWith(isMatched: true),
            matches: gameState.matches + 1,
          );
        } else {
          gameState = gameState.copyWith(
            cards: List.from(gameState.cards)
              ..[flippedCardIndexes[0]] = card1.copyWith(isFlipped: false)
              ..[flippedCardIndexes[1]] = card2.copyWith(isFlipped: false),
          );
        }
        flippedCardIndexes.clear();

        // Check if game is complete
        if (gameState.cards.every((card) => card.isMatched)) {
          gameState = gameState.copyWith(isGameComplete: true);
          gameTimer?.cancel();
          _showGameCompleteDialog();
        }
      });
    });
  }

  void _showGameCompleteDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations! 🎉'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('You completed the game in ${gameState.moves} moves!'),
              Text('Time: ${gameState.secondsElapsed} seconds'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                initializeGame();
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void onDifficultyChanged(GameDifficulty newDifficulty) {
    setState(() {
      gameState = gameState.copyWith(difficulty: newDifficulty);
    });
    initializeGame();
  }

  int _getCrossAxisCount() {
    return switch (gameState.difficulty) {
      GameDifficulty.easy => 3,
      GameDifficulty.medium => 4,
      GameDifficulty.hard => 4,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GameHeader(
              moves: gameState.moves,
              matches: gameState.matches,
              secondsElapsed: gameState.secondsElapsed,
            ),
            Expanded(
              child: Center(
                child: GameBoard(
                  cards: gameState.cards,
                  onCardTap: onCardTap,
                  crossAxisCount: _getCrossAxisCount(),
                ),
              ),
            ),
            GameControls(
              currentDifficulty: gameState.difficulty,
              onReset: initializeGame,
              onDifficultyChanged: onDifficultyChanged,
            ),
          ],
        ),
      ),
    );
  }
}
