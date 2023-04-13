// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repo_searcher/pages/root.dart';
import 'package:repo_searcher/pages/home.dart';
import 'package:repo_searcher/pages/settings.dart';

void main() {
  testWidgets('BottomNavigationBar Navigation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
  await tester.pumpWidget(
    const ProviderScope(
      child: MaterialApp(
        home: RootPage(),
      )));

  expect(find.byKey(const Key("BottomNavigationBar_rootPage")), findsOneWidget);

  await tester.pump();
  await tester.tap(find.byIcon(Icons.home));
  expect(find.byType(Home), findsOneWidget);
  expect(find.byType(Settings), findsNothing);
  
  await tester.tap(find.byIcon(Icons.settings));
  await tester.pump();
  expect(find.byType(Home), findsNothing);
  expect(find.byType(Settings), findsOneWidget);
  });

}
