import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:repo_searcher/providers.dart';
import 'package:repo_searcher/pages/results.dart';


class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputField = ref.watch(searchProvider);
    final copyInputField = {...inputField};

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
                    copyInputField["q"] = "";
                    ref.read(searchProvider.notifier).state = copyInputField;
                    },
                )
              ),
              maxLength: 100, // 仮
              maxLines: 1,
              onChanged: (text){
                copyInputField["q"] = text;
                ref.read(searchProvider.notifier).state = copyInputField;
                print(inputField);
              },
              onSubmitted: inputField["q"] == "" ? null : (_){Navigator.push(context, nextPage());},
            ),
            ElevatedButton(
                onPressed: inputField["q"] == "" ? null :(){
                  print(inputField);
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

