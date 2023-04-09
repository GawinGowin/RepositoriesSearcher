import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_searcher/providers.dart';

import 'package:repo_searcher/modules/itemCard.dart';

class Results extends ConsumerWidget {
  Results({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<int> entries = <int>[for (var i = 0; i < 100; i++) i];

    final inputField = ref.watch(searchProvider);
    final resultsMap = ref.watch(resultsProvider);

    const String host = "api.github.com";
    const String path = '/search/repositories';

    Future<void> getData() async {
      try {
        var response = await http.get(Uri.https(host, path, inputField));
        var responseJson = checkResponse(response);
        ref.read(resultsProvider.notifier).state = responseJson;
        //print(ref.read(resultsProvider));
        //print(Uri.https(host, path, inputField));
        return;
      } catch (_) {
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),

      body: Column(
        children: [
          Container(
            child: Text("$inputField"),
          ),

          Container(
            height: 500,
            child: Column(
              children: [
                Text("$resultsMap"),
              ],
            ),
          ),

          FloatingActionButton(
            onPressed: (){
              getData();
            },
          ),
        ],
      )
      /*
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCard(context);
        }
      )
      */
    );
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