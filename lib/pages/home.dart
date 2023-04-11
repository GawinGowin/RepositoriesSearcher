import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:repo_searcher/providers/home_providers.dart';
import 'package:repo_searcher/pages/results.dart';


class Home extends HookConsumerWidget {
  const Home({super.key});  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputField = ref.watch(searchFieldNotifierProvider);
    final copyInputField = {...inputField};
  
    final textEditingController = useTextEditingController();
    final focusNode = useFocusNode();
    
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
              maxLines: 1,
              maxLength: 256, //根拠：https://docs.github.com/ja/rest/search?apiVersion=2022-11-28#limitations-on-query-length
              focusNode: focusNode,
              controller: textEditingController,
              
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Search",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    textEditingController.clear();
                    final notifier = ref.read(searchFieldNotifierProvider.notifier);
                    notifier.clearTextState();
                  },
                )
              ),

              onChanged: (text){
                copyInputField["q"] = text;
                final notifier = ref.read(searchFieldNotifierProvider.notifier);
                notifier.updateState(copyInputField);
              },
              onSubmitted: inputField["q"] == "" ? null : (_){Navigator.push(context, nextPage());},
            ),
            ElevatedButton(
                onPressed: inputField["q"] == "" ? null :(){
                  Navigator.push(
                    context,
                    nextPage()
                  );
                print(inputField);
                },
                child: const Text("search"),
              ),
          ],
        ),
      )
    );
  }
}

