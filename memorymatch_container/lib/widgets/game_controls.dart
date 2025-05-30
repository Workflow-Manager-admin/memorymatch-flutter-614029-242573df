import 'package:flutter/material.dart';
import '../models/game_state.dart';

class GameControls extends StatelessWidget {
  final GameDifficulty currentDifficulty;
  final VoidCallback onReset;
  final Function(GameDifficulty) onDifficultyChanged;

  const GameControls({
    super.key,
    required this.currentDifficulty,
    required this.onReset,
    required this.onDifficultyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButton<GameDifficulty>(
            value: currentDifficulty,
            onChanged: (GameDifficulty? newValue) {
              if (newValue != null) {
                onDifficultyChanged(newValue);
              }
            },
            items: GameDifficulty.values.map((GameDifficulty difficulty) {
              return DropdownMenuItem<GameDifficulty>(
                value: difficulty,
                child: Text(difficulty.name.toUpperCase()),
              );
            }).toList(),
          ),
          ElevatedButton.icon(
            onPressed: onReset,
            icon: const Icon(Icons.refresh),
            label: const Text('Reset Game'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC107),
              foregroundColor: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
