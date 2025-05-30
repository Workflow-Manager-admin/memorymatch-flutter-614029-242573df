import 'package:flutter/material.dart';
import 'screens/memory_game_screen.dart';

void main() {
  try {
    runApp(const MemoryMatchApp());
  } catch (e) {
    debugPrint('Error starting app: $e');
    // Gracefully handle errors in headless environments
    if (e.toString().contains('cannot open display')) {
      debugPrint('App requires a display to run. This appears to be a headless environment.');
    }
  }
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
