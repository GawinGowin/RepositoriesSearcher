import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart' as path;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_searcher/providers/inputs_providers.dart';

//Widget ItemCard(context, index, itemList);
class ItemCard extends ConsumerWidget {
  const ItemCard({super.key, required this.index, required this.itemList});
  final int index;
  final List<dynamic> itemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var modeNow = ref.watch(themeNotifierProvider.notifier).state;
    if (modeNow == ThemeMode.system){
      bool isDarkMode = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      modeNow = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }

    List<Widget> descriptionCol = [
      Container(margin: const EdgeInsets.all(15),
      child : const Text("No description"))
    ];

    if(itemList[index].description != ""){
      descriptionCol = [
        Container(
          margin: const EdgeInsets.only(top: 5),
          alignment: Alignment.centerLeft,
          child: const Text('description')
        ),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 5),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey)
            ),
          ),
          child: Text('${itemList[index].description}')
        )
      ];
    }

    return Card(
    child: ListTile(
      title: Text('${itemList[index].name}'),
      subtitle: Text('${itemList[index].description}'),
      trailing: IconButton(
        icon: const Icon(Icons.open_in_new),
        onPressed: () {debugPrint('${itemList[index].html_url}');},
      ),
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 150,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 2
                    ),
                  ),
                  child: Image.network('${itemList[index].avatar_url}',)
                ),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${itemList[index].name}',
                    style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.4),
                  ),
                ),
                Table(
                  children: [
                    tablePartial(
                      const Text('Language'),
                      Text('${itemList[index].language=="" ? "None": itemList[index].language}')
                    ),                      
                    tablePartial(
                      loadIcon("assets/icons/star.svg", modeNow),
                      Text('${itemList[index].stargazers_count}'),
                    ),
                    tablePartial(
                      loadIcon("assets/icons/eye.svg", modeNow),
                      Text('${itemList[index].watchers_count}')
                    ),
                    tablePartial(
                      loadIcon("assets/icons/repo-forked.svg", modeNow),
                      Text('${itemList[index].forks_count}')
                    ),
                    tablePartial(
                      loadIcon("assets/icons/issue-opened.svg", modeNow),
                      Text('${itemList[index].open_issues_count}')
                    ),       
                  ],
                ),
                Column(children: descriptionCol,
                )
              ],
            ),
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
}
 
TableRow tablePartial(Widget key, Widget value){
  return TableRow(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Center(child: key)
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Center(child: value)
      ),
    ]
  );
}

Widget loadIcon(String fPath, mode){
  String fileName = path.basenameWithoutExtension(fPath).split('.').first;
  final Widget svg = SvgPicture.asset(
    fPath,
    semanticsLabel: fileName
  );
  if (mode==ThemeMode.dark){// ダークテーマ
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        -1,  0,  0, 0, 255,
        0, -1,  0, 0, 255,
        0,  0, -1, 0, 255,
        0,  0,  0, 1,   0,
      ]),
      child: svg,
    );
  }
  else {
    return svg;
  }
}