import 'package:flutter/material.dart';
import 'package:repo_searcher/modules/item_card.dart';

Widget ItemList(context, itemList) {
  if (itemList.length != 0){
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemCard(index:index, itemList:itemList);
      }
    );
  }
  else{
    return const Text("検索結果はありません");
  }
}
