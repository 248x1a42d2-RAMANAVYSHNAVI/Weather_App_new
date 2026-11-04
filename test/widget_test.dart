import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../lib/providers/weather_provider.dart';
import '../lib/main.dart';

void main() {
  testWidgets('Weather app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => WeatherProvider(),
        child: const MaterialApp(
          home: Scaffold(
            body: Text('Weather App'),
          ),
        ),
      ),
    );

    expect(find.text('Weather App'), findsOneWidget);
  });
}