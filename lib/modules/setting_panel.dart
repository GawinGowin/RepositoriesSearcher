import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repo_searcher/providers/inputs_providers.dart';

class SettingPanel extends ConsumerWidget {
  const SettingPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputField = ref.watch(searchFieldNotifierProvider);
    final copyInputField = {...inputField};

    double perPage = double.parse(inputField["per_page"]);
    String order = inputField["order"];
    String orderShow = order=="desc"? "降順":"昇順";
    String sort = returnSortType(inputField["sort"]);

    debugPrint("$inputField");

    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: const Text('Sort'),
            trailing: Text(sort),
          ),

          Container(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    copyInputField["sort"] = "";
                    ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
                  },
                  child: const Text('best match'),
                ),
                OutlinedButton(
                  onPressed: () {
                    copyInputField["sort"] = "stars";
                    ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
                  },
                  child: const Text('stars'),
                ),
                OutlinedButton(
                  onPressed: () {
                    copyInputField["sort"] = "forks";
                    ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
                  },
                  child: const Text('forks'),
                ),
                OutlinedButton(
                  onPressed: () {
                    copyInputField["sort"] = "help-wanted-issues";
                    ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
                  },
                  child: const Text('help-wanted-issues'),
                ),
                OutlinedButton(
                  onPressed: () {
                    copyInputField["sort"] = "updated";
                    ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
                  },
                  child: const Text('updated')
                ),
              ],          
            ),
          ),

          ListTile(
            title: const Text('並び順'),
            trailing: Text(orderShow),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  copyInputField["order"] = "desc";
                  ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
                },
                child: const Text('降順'),
              ),
              OutlinedButton(
                onPressed: () {
                  copyInputField["order"] = "asc";
                  ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
                },
                child: const Text('昇順'),
              ),
          ],),

          ListTile(
            title: const Text('1ページ当たりの表示件数'),
            trailing: Text('${perPage.toInt()}'),
          ),

          Slider(
            value: perPage,
            onChanged: (double value){
              copyInputField["per_page"] = "${value.toInt()}";
              ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
            },
            min: 1,
            max: 100,
            divisions: 99,
          ),
      ],)
    );
  }
}

returnSortType(String text){
  switch (text){
    case "stars":
      return "スター数";

    case "forks":
      return "フォーク数";

    case "help-wanted-issues":
      return "Help wanted issues";

    case "updated":
      return "更新日時";

    default:
      return "関連性";
  }
}
