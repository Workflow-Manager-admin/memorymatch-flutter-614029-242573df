import 'package:flutter/material.dart';
import '../models/memory_card.dart';
import 'memory_card_widget.dart';

class GameBoard extends StatelessWidget {
  final List<MemoryCard> cards;
  final Function(int) onCardTap;
  final int crossAxisCount;

  const GameBoard({
    super.key,
    required this.cards,
    required this.onCardTap,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: cards.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return MemoryCardWidget(
            card: cards[index],
            onTap: () => onCardTap(index),
          );
        },
      ),
    );
  }
}
