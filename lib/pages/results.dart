import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_searcher/providers.dart';

class Results extends ConsumerWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputedText = ref.watch(inputFieldProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Text('$inputedText'),
    );
  }
}