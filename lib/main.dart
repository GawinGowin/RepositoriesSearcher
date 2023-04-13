import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repo_searcher/providers/inputs_providers.dart';
import 'package:repo_searcher/pages/root.dart';

import 'package:repo_searcher/themes/theme.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child){
        final defaultMode = ref.watch(themeNotifierProvider);

        return MaterialApp(
          home: const RootPage(),
          theme: lightThemeData,
          darkTheme: darkThemeData,
          themeMode: defaultMode,
        );
      }
    );
  }
}