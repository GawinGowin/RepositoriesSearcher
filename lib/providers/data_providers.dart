import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:repo_searcher/utils/response_data.dart';
import 'package:repo_searcher/providers/home_providers.dart';
part 'data_providers.g.dart';

//flutter pub run build_runner watch --delete-conflicting-outputs

@riverpod
class DataNotifier extends _$DataNotifier {
  // Todo refuctor
  //AsyncNotifierのbuild()メソッド内でref.watchおよびref.readの使用が推奨されないため
  @override
  Future<List> build() async {
    String host = "api.github.com";
    String path = '/search/repositories';

    final inputField = ref.watch(searchFieldNotifierProvider);

    var response = await http.get(Uri.https(host, path, inputField));
    var responseJson = checkResponse(response);

    int count = responseJson["total_count"];

    final notifier = ref.read(repoCountNotifierProvider.notifier);
    notifier.updateState(count);

    List items = responseJson["items"];
    List formedItems = items.map((e) => cleanData(e)).toList();
    return formedItems;
  }  
  
  void resetState() async {
    state = const AsyncValue.loading();
    state = const AsyncValue.data([]);
  }
}

@riverpod
class RepoCountNotifier extends _$RepoCountNotifier {
  @override
  int build() {
    return 0;
  }

  void updateState(newData) {
    state = newData;
  }
  void resetState() {
    state = 0;
  }  
}

dynamic checkResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return jsonDecode(response.body);
    case 400:
      throw Exception('400');
    case 401:
      throw Exception('401');
    case 403:
      throw Exception('レート制限です。時間を置いてリトライしてください。');
    case 404:
      throw Exception('404 Not Found');
    case 500:
      throw Exception('500');
    default:
      throw Exception('検索ごとに最大 1,000 件の結果が取得可能です。');
  }
}