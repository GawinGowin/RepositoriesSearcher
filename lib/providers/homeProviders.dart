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

//HomePage
final searchProvider = StateProvider(
  (ref) => <String, String>{
    "q":"",
    "sort":"",
    "order":"",
    "per_page":"",
    "page":"",
    }
  );
