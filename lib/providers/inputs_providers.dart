import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'inputs_providers.g.dart';

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
  Map<String, dynamic> initMap = <String, dynamic>{
        "q":"",
        "sort":"",
        "order":"desc",
        "per_page":"30",
        "page":"1",
      };  
  @override
  Map<String, dynamic> build() {
    return initMap;
  }
  void updateState(altMap) {
    state = altMap;
  }
  void resetState() {
    state = initMap;
  } 
  void resetPageState() {
    var copyState = {...state};
    copyState["page"] = "1";   
    state = copyState;
  }
  void clearTextState() {
    var copyState = {...state};
    copyState["q"] = "";   
    state = copyState;
  }
}

//RootPage
@riverpod
class AlertMsgNotifier extends _$AlertMsgNotifier {
  @override
  bool build() {
    return false;
  }
  void deactivateState() {
    state = false;
  }
  void activateState() {
    state = true;
  }  
}