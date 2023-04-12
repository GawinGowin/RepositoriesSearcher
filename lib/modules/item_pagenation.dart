import 'package:flutter/material.dart';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_searcher/providers/inputs_providers.dart';

class BottomPagenation extends ConsumerWidget {
  const BottomPagenation({super.key, required this.totalReposCount});
  final int totalReposCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputField = ref.watch(searchFieldNotifierProvider); 
    int nowPage = int.parse(inputField["page"]);
    int repoPerPage = int.parse(inputField["per_page"]);

    const Widget more = Icon(Icons.more_horiz);

    Widget createNumButton(int number, bool now){
      onPressedFunction(){
        final copyInputField = {...inputField};
        copyInputField["page"] = "$number";
        ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);

        ref.read(alertMsgNotifierProvider.notifier).setState();
      }

      if(now){
        return FilledButton(
          onPressed: onPressedFunction,
          child: Text('$number'),
        );
      }

      else{
        return ElevatedButton(
          onPressed: onPressedFunction,
          child: Text('$number'),
        );
      }
    }
  int totalReposCountCopy = totalReposCount > 1000 ? 1000 : totalReposCount;
  double totalPagesdouble = totalReposCountCopy / repoPerPage;
  int totalPages = totalPagesdouble.ceil();

  List<Widget> pageList = [];

  if (totalPages == 1){
    return const SizedBox.shrink();
  }    

  else if (totalPages <= 7){
    for (var i = 1; i < totalPages + 1 ; i++){
      pageList.add(createNumButton(i, i==nowPage));
    }
  }

  else if (nowPage < 3){
    for (var i = 1; i < 4 ; i++){
      pageList.add(createNumButton(i, i==nowPage));
    }
    pageList.add(more);
    pageList.add(createNumButton(totalPages, false));
  }

  else if (nowPage + 2 > totalPages) {
    for (var i = totalPages - 2 ; i < totalPages + 1; i++){
      pageList.add(createNumButton(i, i==nowPage));
    }
    pageList.insert(0, more);
    pageList.insert(0, createNumButton(1, false));    
  } 

  else if (nowPage == 3) {
    for (var i = 1; i < 5 ; i++){
      pageList.add(createNumButton(i, i==nowPage));
    }
    pageList.add(more);
    pageList.add(createNumButton(totalPages, false));
  } 

  else if (nowPage + 2 == totalPages) {
    for (var i = totalPages - 3 ; i < totalPages + 1; i++){
      pageList.add(createNumButton(i, i==nowPage));
    }
    pageList.insert(0, more);
    pageList.insert(0, createNumButton(1, false));  
  }    

  else {
    pageList.add(createNumButton(1, false));  
    pageList.add(more);

    for (var i = nowPage - 1 ; i < nowPage + 2; i++){
      pageList.add(createNumButton(i, i==nowPage));
    }
    pageList.add(more);
    pageList.add(createNumButton(totalPages, false));
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: pageList,
  );
  }
}