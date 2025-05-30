import 'package:flutter/material.dart';
import 'screens/memory_game_screen.dart';

void main() {
  runApp(const MemoryMatchApp());
}

class MemoryMatchApp extends StatelessWidget {
  const MemoryMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Match',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF1976D2),
          secondary: Colors.white,
          tertiary: const Color(0xFFFFC107),
        ),
        useMaterial3: true,
      ),
      home: const MemoryGameScreen(),
    );
  }
}
