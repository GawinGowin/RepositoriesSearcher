import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repo_searcher/providers/home_providers.dart';
import 'package:repo_searcher/providers/data_providers.dart';

import 'package:repo_searcher/modules/item_list.dart';
import 'package:repo_searcher/modules/item_pagenation.dart';

class Results extends ConsumerWidget {
  const Results({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemList = ref.watch(dataNotifierProvider); 
    final itemListModule = itemList.when(
      loading: () => const Center(child: CircularProgressIndicator(),),
      error: (e, s) => Center(child: Text('$e')),
      data: (d) => Center(child: ItemList(context, d)),
    );
    final int totalRepos = ref.watch(repoCountNotifierProvider); // dataNotifierProviderで件数の取得等は行った。
    final inputField = ref.watch(searchFieldNotifierProvider); // Pagenation制御のために必要。
    final alertCheck = ref.watch(alertMsgNotifierProvider);

    if (alertCheck && totalRepos > 1000){
      const snackBar = SnackBar(content: Text('検索ごとに最大1,000件の結果を提供しています。'));
      Future.delayed(const Duration(seconds: 0), () {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Total: $totalRepos Repositories'),
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          final resNotifier = ref.read(repoCountNotifierProvider.notifier);
          final dataNotifier = ref.read(dataNotifierProvider.notifier);
          final fieldNotifier = ref.read(searchFieldNotifierProvider.notifier);
          final alertNotifier = ref.read(alertMsgNotifierProvider.notifier);
          resNotifier.resetState();
          dataNotifier.resetState();
          fieldNotifier.resetPageState();
          alertNotifier.resetState();
          Navigator.pop(context);
        },
      )
      ),
      body: itemListModule,

      bottomNavigationBar: PagenationList(
        ref, int.parse(inputField["page"]), int.parse(inputField["per_page"]), totalRepos
        // リファクタリングの余地あり。inputField["page"]などはPagenationList内部でも取得できる。
      ),
    );
  }
}