import 'package:flutter/material.dart';

Widget ItemCard(context, index, itemList) {
  
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

          title: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black,
                  width: 2
              ),
            ),
            child: Image.network('${itemList[index].avatar_url}',)
          ),

          content: SingleChildScrollView(
            child: Column(
              children: [   
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${itemList[index].name}',
                    style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.4),
                  ),
                ),
                // https://primer.style/design/foundations/icons/
                Table(
                  children: [
                    tablePartial(
                      const Text('Language'),
                      Text('${itemList[index].language=="" ? "None": itemList[index].language}')
                    ),                      
                    tablePartial(
                      const Icon(Icons.star_border),
                      Text('${itemList[index].stargazers_count}'),
                    ),
                    tablePartial(
                      const Icon(Icons.visibility),
                      Text('${itemList[index].watchers_count}')
                    ),
                    tablePartial(
                      const Icon(Icons.lan_outlined),
                      Text('${itemList[index].forks_count}')
                    ),
                    tablePartial(
                      const Icon(Icons.adjust),
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