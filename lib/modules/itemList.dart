import 'package:flutter/material.dart';
import 'package:repo_searcher/modules/itemCard.dart';

Widget ItemList(context, d) {
  if (d.length != 0){
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: d.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCard(context, index, d);
        }
      ),
    );
  }
  else{
    return const Text("検索結果はありません");
  }
}
