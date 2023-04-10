import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'homeProviders.g.dart';

//RootPage
@riverpod
class PageNotifier extends _$PageNotifier {
  @override
  int build() {
    return 0; // 最初のデータ
  }

  void updateState(nextPage) { // データを変更する関数
    state = nextPage; // データを上書き
  }
}

@riverpod
class SearchFieldNotifier extends _$SearchFieldNotifier {
  @override
  Map<String, dynamic> build() {
    Map<String, dynamic> initMap = <String, dynamic>{
      "q":"",
      "sort":"",
      "order":"",
      "per_page":"",
      "page":"",
    };
    return initMap;
  }
  void updateState(altMap) {
    state = altMap;
  }
}