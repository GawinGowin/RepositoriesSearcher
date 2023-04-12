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

    List<String> sortTypes = ["", "stars", "forks", "help-wanted-issues", "updated"];
    Map<String,String> orderTypes = {"降順":"desc", "昇順":"asc"};

    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: const Text('Sort'),
            trailing: Text(sort),
          ),

          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                for (final sortName in sortTypes)
                  OutlinedButton(
                    onPressed: () {
                      copyInputField["sort"] = sortName;
                      ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
                    },
                    child: Text(returnSortType(sortName)),
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
              for (final orderKey in orderTypes.keys)
                OutlinedButton(
                  onPressed: () {
                    copyInputField["order"] = orderTypes[orderKey];
                    ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
                  },
                  child: Text(orderKey),
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

String returnSortType(String text){
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
