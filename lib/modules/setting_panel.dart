import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repo_searcher/providers/home_providers.dart';

class SettingPanel extends ConsumerWidget {
  const SettingPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputField = ref.watch(searchFieldNotifierProvider);
    final copyInputField = {...inputField};

    double perPage = double.parse(inputField["per_page"]);

    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('Sort'),
            tileColor: Colors.grey,
          ),
          ListTile(
            title: Text('昇順'),
            tileColor: Colors.grey,
          ),
          ListTile(
            title: Text('1ページ当たりの表示件数'),
            tileColor: Colors.grey,
          ),
        Slider(
          value: perPage,
          onChanged: (double value){
            final inputFieldnotifier = ref.read(searchFieldNotifierProvider.notifier);
            copyInputField["per_page"] = "${value.toInt()}";
            inputFieldnotifier.updateState(copyInputField);          
            print("${value.toInt()}") ;
          },
          min: 1,
          max: 100,
          divisions: 99,
        ),
      ],)
    );
  }
}