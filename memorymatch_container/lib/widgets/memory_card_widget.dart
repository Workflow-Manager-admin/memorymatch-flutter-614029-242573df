import 'package:flutter/material.dart';
import '../models/memory_card.dart';

class MemoryCardWidget extends StatelessWidget {
  final MemoryCard card;
  final VoidCallback onTap;

  const MemoryCardWidget({
    super.key,
    required this.card,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: card.isMatched ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.rotationY(card.isFlipped ? 3.14 : 0),
        child: Card(
          color: card.isMatched
              ? Colors.green.withOpacity(0.3)
              : card.isFlipped
                  ? const Color(0xFF1976D2)
                  : Colors.white,
          elevation: card.isFlipped ? 4 : 2,
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: card.isFlipped || card.isMatched
                  ? Icon(
                      card.icon,
                      size: 32,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.question_mark,
                      size: 32,
                      color: Color(0xFF1976D2),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
