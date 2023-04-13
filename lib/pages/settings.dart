import 'package:flutter/material.dart';

import 'package:repo_searcher/modules/setting_panel.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '検索オプション',
                      style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.6),
                    ),
                  ),
                  const SettingPanel(),

              ]),
              )
          ],
        )
      ),
    );
  }
}
