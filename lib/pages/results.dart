import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repo_searcher/providers/inputs_providers.dart';
import 'package:repo_searcher/providers/data_providers.dart';

import 'package:repo_searcher/modules/item_list.dart';
import 'package:repo_searcher/modules/item_pagenation.dart';

class Results extends HookConsumerWidget {
  const Results({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemList = ref.watch(dataNotifierProvider); //ここで検索結果を取得
    final itemListModule = itemList.when(
      loading: () => const Center(child: CircularProgressIndicator(),), //結果が得られるまでは読み込みアニメーション
      error: (e, s) => Center(child: Text('$e')), //エラーが発生したら、テキスト
      data: (d) => Center(child: ItemList(context, d)), //結果をレイアウトしたWidget
    );
    final int count = ref.watch(repoCountNotifierProvider); // dataNotifierProviderで取得した検索結果の件数を取得
    final alertCheck = ref.watch(alertMsgNotifierProvider);

    if (alertCheck && count > 1000){
      const snackBar = SnackBar(content: Text('提供できるのは上位1,000件です。'), duration: Duration(seconds: 2),);
      Future.delayed(const Duration(seconds: 0), () {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        ref.read(alertMsgNotifierProvider.notifier).deactivateState();
        debugPrint("Hey");
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Total: $count Repositories'),
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          ref.read(repoCountNotifierProvider.notifier).resetState();
          ref.read(dataNotifierProvider.notifier).resetState();
          ref.read(searchFieldNotifierProvider.notifier).resetPageState();
          Navigator.pop(context);
        },
      )
      ),
      body: itemListModule,

      bottomNavigationBar: BottomPagenation(totalReposCount: count)

    );
  }
}