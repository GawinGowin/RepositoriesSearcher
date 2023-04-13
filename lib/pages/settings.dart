import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:repo_searcher/modules/setting_panel.dart';
import 'package:repo_searcher/providers/inputs_providers.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var modeNow = ref.watch(themeNotifierProvider);
    if (modeNow == ThemeMode.system){
      bool isDarkMode = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      modeNow = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
    var switchIcon = modeNow == ThemeMode.light ? Icons.dark_mode : Icons.light_mode;
    var modeNext = modeNow == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(switchIcon),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).updateState(modeNext);
            },
          ),
        ],
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
