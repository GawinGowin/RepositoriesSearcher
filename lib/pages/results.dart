import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_searcher/providers/providers.dart';

import 'package:repo_searcher/modules/itemCard.dart';

import 'package:repo_searcher/utils/responseData.dart';

const String host = "api.github.com";
const String path = '/search/repositories';

class Results extends ConsumerWidget {
  Results({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputField = ref.watch(searchProvider);
    final itemList = ref.watch(itemsProvider);
    final responseList = ref.watch(responseProvider);

    getData(ref, inputField);

    return Scaffold(
      appBar: AppBar(
        title: Text('Total: ${responseList["total_count"]} Repositories'),
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          ref.read(responseProvider.notifier).state = {};
          ref.read(itemsProvider.notifier).state = [];
          Navigator.pop(context, );
        },
      )
      ),

      body: 
        Container(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: itemList.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemCard(context, index, itemList);
            }
          ),
        ),

      floatingActionButton: FloatingActionButton( //仮
        onPressed: (){
          getData(ref, inputField);
        },
        child: const Icon(Icons.sync),
      ),
    );
  }
}

Future<void> getData(ref, inputField) async {
  try {
    var response = await http.get(Uri.https(host, path, inputField));
    var responseJson = checkResponse(response);
    
    int count = responseJson["total_count"];
    bool incomplete_results = responseJson["incomplete_results"];
    ref.read(responseProvider.notifier).state = {"total_count": count, "incomplete_results": incomplete_results};

    List items = responseJson["items"];
    List formedItems = items.map((e) => cleanData(e)).toList();

    ref.read(itemsProvider.notifier).state = formedItems;
    print("$count, $incomplete_results");
    return;
  } catch (_) {
  }
}

dynamic checkResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return jsonDecode(response.body);
    case 400:
      throw Exception('一般的なクライアントエラーです');
    case 401:
      throw Exception('アクセス権限がない、または認証に失敗しました');
    case 403:
      throw Exception('閲覧権限がないファイルやフォルダです');
    case 404:
      throw Exception('404 Not Found');
    case 500:
      throw Exception('何らかのサーバー内で起きたエラーです');
    default:
      throw Exception('何かしらの問題が発生しています');
  }
}