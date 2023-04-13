import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:repo_searcher/providers/inputs_providers.dart';
import 'package:repo_searcher/pages/results.dart';


class Home extends HookConsumerWidget {
  const Home({super.key});  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputField = ref.watch(searchFieldNotifierProvider);
    ref.watch(alertMsgNotifierProvider);

    final copyInputField = {...inputField};
    
    final textEditingController = useTextEditingController(text: inputField["q"]);
    final focusNode = useFocusNode();
    
    nextPage () => MaterialPageRoute(builder: (context){return const Results();});

    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ホーム'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
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
                      ref.read(searchFieldNotifierProvider.notifier).clearTextState();
                    },
                  )
                ),
              onChanged: (text){
                copyInputField["q"] = text;
                ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
              },
              onSubmitted: inputField["q"] == "" ? null : (_){
                ref.read(alertMsgNotifierProvider.notifier).activateState();
                Navigator.push(context, nextPage());
                },
              ),

              ElevatedButton(
                onPressed: inputField["q"] == "" ? null :(){
                  ref.read(alertMsgNotifierProvider.notifier).activateState();
                  Navigator.push(context, nextPage());
                },
                child: const Text("search"),
              ),
            ],
          ),)
        )

          
        )
      );
  }
}

