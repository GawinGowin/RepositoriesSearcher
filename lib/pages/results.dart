import 'package:flutter/material.dart';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_searcher/providers.dart';

import 'package:repo_searcher/modules/itemCard.dart';

class Results extends ConsumerWidget {
  Results({Key? key}) : super(key: key);

  final List<int> entries = <int>[for (var i = 0; i < 100; i++) i];

  Future<void> getData() async {
    return ;
  }



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputField = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCard(context);
        }
      )
    );
  }
}