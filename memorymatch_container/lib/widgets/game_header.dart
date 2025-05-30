import 'package:flutter/material.dart';

class GameHeader extends StatelessWidget {
  final int moves;
  final int matches;
  final int secondsElapsed;

  const GameHeader({
    super.key,
    required this.moves,
    required this.matches,
    required this.secondsElapsed,
  });

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text(
                'Moves',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                moves.toString(),
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                'Matches',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                matches.toString(),
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                'Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _formatTime(secondsElapsed),
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
