import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:repo_searcher/utils/responseData.dart';
import 'package:repo_searcher/providers/providers.dart';
part 'dataProviders.g.dart';

//flutter pub run build_runner watch --delete-conflicting-outputs

@riverpod
class DataNotifier extends _$DataNotifier {
  @override
  Future<List> build() async {
    String host = "api.github.com";
    String path = '/search/repositories';
    final inputField = ref.watch(searchProvider);

    var response = await http.get(Uri.https(host, path, inputField));
    var responseJson = checkResponse(response);

    int count = responseJson["total_count"]; // どこかに移行予定
    bool incomplete_results = responseJson["incomplete_results"]; // どこかに移行予定

    List items = responseJson["items"];
    List formedItems = items.map((e) => cleanData(e)).toList();
    return formedItems;
  }
  
  void resetState() async {
    state = const AsyncValue.loading();
    state = const AsyncValue.data([]);
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