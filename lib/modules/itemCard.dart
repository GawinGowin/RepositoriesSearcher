import 'package:flutter/material.dart';

ItemCard(context) {
  return Card(
        child: ListTile(
          title: Text('title'),
          subtitle: Text('sub-title'),
          trailing: IconButton(
            icon: const Icon(Icons.open_in_new),
            onPressed: () {},
          ),
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Title'),
              content: const Text('detail'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            ),
          )
        )
  );
}

/**参考
 * https://api.flutter.dev/flutter/material/ListTile-class.html
 * https://api.flutter.dev/flutter/material/AlertDialog-class.html
 */
