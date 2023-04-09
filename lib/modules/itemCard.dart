import 'package:flutter/material.dart';

ItemCard() {
  return Card(
        child: ListTile(
          title: Text('title'),
          subtitle: Text('sub-title'),
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
          onTap: () {},
      )
    );
}
