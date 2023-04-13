import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repo_searcher/pages/root.dart';

import 'package:repo_searcher/themes/theme.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: const RootPage(),
        theme: lightThemeData,
        darkTheme: darkThemeData,
        themeMode: ThemeMode.system,
      ),
    ),
  );
}
