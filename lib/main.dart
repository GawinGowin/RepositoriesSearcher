import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repo_searcher/providers/inputs_providers.dart';

import 'package:repo_searcher/pages/home.dart';
import 'package:repo_searcher/pages/settings.dart';

void main() {
  const app = MaterialApp(home: RootPage());
  const scope = ProviderScope(
    child: app
  );
  runApp(scope);
}

class RootPage extends ConsumerWidget {
  const RootPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(pageNotifierProvider);

    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label:"ホーム"
        ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label:"オプション"
        ),  
    ];

    final pages = [
      const Home(),
      const Settings(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: index,
          onTap: (indexTap){
            ref.read(pageNotifierProvider.notifier).updateState(indexTap);
          },
        )
    );
  }
}