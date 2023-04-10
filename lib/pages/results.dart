import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:repo_searcher/providers/providers.dart';
import 'package:repo_searcher/providers/dataProviders.dart';

import 'package:repo_searcher/modules/itemCard.dart';
import 'package:repo_searcher/utils/responseData.dart';

class Results extends ConsumerWidget {
  Results({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputField = ref.watch(searchProvider);
    final responseList = ref.watch(responseProvider);

    final itemList = ref.watch(dataNotifierProvider);
    final itemListModule = itemList.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (d) => Text('取得したデータが存在'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Total: ${responseList["total_count"]} Repositories'),
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () { // Homeに戻る際に情報をリセット
          ref.read(responseProvider.notifier).state = {};

          final dataNotifier = ref.read(dataNotifierProvider.notifier);
          dataNotifier.resetState();
          Navigator.pop(context, );
        },
      )
      ),

      body: itemListModule,
        /*
        Container(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: itemList.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemCard(context, index, itemList);
            }
          ),
        ),
        */

      floatingActionButton: FloatingActionButton( //仮
        onPressed: (){
          //getData(ref, inputField);
        },
        child: const Icon(Icons.sync),
      ),
    );
  }
}