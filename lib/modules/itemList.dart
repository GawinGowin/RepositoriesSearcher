import 'package:flutter/material.dart';
import 'package:repo_searcher/modules/itemCard.dart';

ItemList(context, d) {
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
