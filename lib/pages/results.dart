import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:repo_searcher/providers/dataProviders.dart';

import 'package:repo_searcher/modules/itemList.dart';

class Results extends ConsumerWidget {
  Results({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemList = ref.watch(dataNotifierProvider); 
    final itemListModule = itemList.when(
      loading: () => const Center(child: CircularProgressIndicator(),),
      error: (e, s) => Center(child: Text('エラー $e')),
      data: (d) => Center(child: ItemList(context, d)),
    );

    final resInfo = ref.watch(responseNotifierProvider); // dataNotifierProviderで件数の取得等は行った。

    return Scaffold(
      appBar: AppBar(
        title: Text('Total: ${resInfo["count"]} Repositories'),
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () { // Homeに戻る際に情報をリセット
          final resNotifier = ref.read(responseNotifierProvider.notifier);
          final dataNotifier = ref.read(dataNotifierProvider.notifier);
          resNotifier.resetState();
          dataNotifier.resetState();
          Navigator.pop(context);
        },
      )
      ),
      body: itemListModule,

      floatingActionButton: FloatingActionButton( //仮
        onPressed: (){
          
        },
        child: const Icon(Icons.sync),
      ),
    );
  }
}