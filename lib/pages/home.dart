import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:repo_searcher/providers.dart';
import 'package:repo_searcher/pages/results.dart';


class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputText = ref.watch(inputFieldProvider);
    nextPage () => MaterialPageRoute(builder: (context){return Results();});

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    ref.read(inputFieldProvider.notifier).state = "";
                    },
                )
              ),
              maxLength: 100, // 仮
              maxLines: 1,
              onChanged: (text){ref.read(inputFieldProvider.notifier).state = text;},
              onSubmitted: inputText == "" ? null : (_){Navigator.push(context, nextPage());},
            ),
            ElevatedButton(
                onPressed: inputText == "" ? null :(){
                  print(inputText);
                  Navigator.push(
                    context,
                    nextPage()
                  );
                },
                child: const Text("search"),
              ),
          ],
        ),
      )
    );
  }
}

