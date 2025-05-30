import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:memorymatch_container/main.dart';

void main() {
  testWidgets('Memory Match Game smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MemoryMatchApp());

    // Verify basic game elements are present
    expect(find.byType(GameHeader), findsOneWidget);
    expect(find.byType(GameBoard), findsOneWidget);
    expect(find.byType(GameControls), findsOneWidget);
  });
}
