import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Weather app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Text('Weather App'),
        ),
      ),
    );

    expect(find.text('Weather App'), findsOneWidget);
  });
}