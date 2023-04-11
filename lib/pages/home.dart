import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repo_searcher/providers/home_providers.dart';
import 'package:repo_searcher/pages/results.dart';


class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputField = ref.watch(searchFieldNotifierProvider);
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
                border: const OutlineInputBorder(),
                labelText: "Search",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    //Todo
                    //copyInputField["q"] = "";
                    //ref.read(searchProvider.notifier).state = copyInputField;
                    },
                )
              ),
              maxLength: 256, //根拠：https://docs.github.com/ja/rest/search?apiVersion=2022-11-28#limitations-on-query-length
              maxLines: 1,
              onChanged: (text){
                copyInputField["q"] = text;
                final notifier = ref.read(searchFieldNotifierProvider.notifier);
                notifier.updateState(copyInputField);
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

