import 'package:flutter/material.dart';

ItemCard(context, index, itemList) {
  return Card(
    child: ListTile(
      title: Text('${itemList[index].name}'),
      subtitle: Text('${itemList[index].description}'),
      trailing: IconButton(
        icon: const Icon(Icons.open_in_new),
        onPressed: () {print('${itemList[index].html_url}');},
      ),
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Image.network('${itemList[index].avatar_url}'),
          content: Column(
            children: [
              Text('${itemList[index].name}'),
              Text('${itemList[index].description}'),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Language'),
                  Text('${itemList[index].language}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Star'),
                  Text('${itemList[index].stargazers_count}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('watcher'),
                  Text('${itemList[index].watchers_count}')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('forks'),
                  Text('${itemList[index].forks_count}')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Issue'),
                  Text('${itemList[index].open_issues_count}')
                ],
              ),
            ],
          ),
          
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
