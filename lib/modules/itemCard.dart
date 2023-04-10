import 'package:flutter/material.dart';

ItemCard(context, index, resultsList) {
  return Card(
    child: ListTile(
      title: Text('${resultsList[index].name}'),
      subtitle: Text('${resultsList[index].description}'),
      trailing: IconButton(
        icon: const Icon(Icons.open_in_new),
        onPressed: () {print('${resultsList[index].html_url}');},
      ),
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Image.network('${resultsList[index].avatar_url}'),
          content: Column(
            children: [
              Text('${resultsList[index].name}'),
              Text('${resultsList[index].description}'),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Language'),
                  Text('${resultsList[index].language}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Star'),
                  Text('${resultsList[index].stargazers_count}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('watcher'),
                  Text('${resultsList[index].watchers_count}')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('forks'),
                  Text('${resultsList[index].forks_count}')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Issue'),
                  Text('${resultsList[index].open_issues_count}')
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
