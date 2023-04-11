import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_searcher/providers/homeProviders.dart';

PagenationList(WidgetRef ref, int nowPage, int repoPerPage, int totalRepos){

  Widget returnNumButton(int number, bool now){
    onPressedFunction(){
      final inputField = ref.read(searchFieldNotifierProvider);
      final copyInputField = {...inputField};
      copyInputField["page"] = "$number";
      final notifier = ref.read(searchFieldNotifierProvider.notifier);
      notifier.updateState(copyInputField);   
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

  int totalPages = totalRepos ~/ repoPerPage;
 
  const Widget more = Icon(Icons.more_horiz);
  const Widget next = Icon(Icons.navigate_next);
  const Widget before = Icon(Icons.navigate_before);

  List<Widget> pageList = [];

  if (totalPages == 0){
    return ;
  }    

  else if (totalPages <= 7){
    for (var i = 1; i < totalPages + 1 ; i++){
      pageList.add(returnNumButton(i, i==nowPage));
    }
  }

  else if (nowPage < 3){
    for (var i = 1; i < 4 ; i++){
      pageList.add(returnNumButton(i, i==nowPage));
    }
    pageList.add(more);
    pageList.add(returnNumButton(totalPages, false));
  }

  else if (nowPage + 2 > totalPages) {
    for (var i = totalPages - 2 ; i < totalPages + 1; i++){
      pageList.add(returnNumButton(i, i==nowPage));
    }
    pageList.insert(0, more);
    pageList.insert(0, returnNumButton(1, false));    
  } 

  else if (nowPage == 3) {
    for (var i = 1; i < 5 ; i++){
      pageList.add(returnNumButton(i, i==nowPage));
    }
    pageList.add(more);
    pageList.add(returnNumButton(totalPages, false));
  } 

  else if (nowPage + 2 == totalPages) {
    for (var i = totalPages - 3 ; i < totalPages + 1; i++){
      pageList.add(returnNumButton(i, i==nowPage));
    }
    pageList.insert(0, more);
    pageList.insert(0, returnNumButton(1, false));  
  }    

  else {
    pageList.add(returnNumButton(1, false));  
    pageList.add(more);

    for (var i = nowPage - 1 ; i < nowPage + 2; i++){
      pageList.add(returnNumButton(i, i==nowPage));
    }
    pageList.add(more);
    pageList.add(returnNumButton(totalPages, false));
  }

  pageList.insert(0, before);
  pageList.add(next);

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: pageList,
  );
}



