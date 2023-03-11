// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_projeto/list_register.dart';

import 'package:mini_projeto/main.dart';
import 'package:provider/provider.dart';

void main() {
  // create a test to test the share button
  testWidgets('Share button test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
          create: (context) => ListaDeRegistos(),
          child: const MyApp()),
    );

    // Verify that our counter starts at 0.
    expect(find.text('Share'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.text('Partilhar'));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Share'), findsOneWidget);
  });
}