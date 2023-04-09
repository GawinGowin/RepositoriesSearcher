import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:repo_searcher/providers.dart';

import 'package:repo_searcher/pages/home.dart';
import 'package:repo_searcher/pages/settings.dart';

main() async{
  const app = MaterialApp(home: Root());
  const scope = ProviderScope(
    child: app
  );
  runApp(scope);
}

class Root extends ConsumerWidget {
  const Root({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexProvider);

    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label:"Home"
        ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label:"Settings"
        ),  
    ];

    final pages = [
      Home(),
      Settings(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: index,
          onTap: (indexTap){
            ref.read(indexProvider.notifier).state = indexTap;
          },
        )
    );
  }
}