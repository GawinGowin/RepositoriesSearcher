import 'package:flutter_riverpod/flutter_riverpod.dart';

//RootPage
final indexProvider = StateProvider((ref) => 0);

//HomePage
final searchProvider = StateProvider(
  (ref) => <String, String>{
    "q":"",
    "sort":"",
    "order":"",
    "per_page":"",
    "page":"",
    }
  );

//ResultPage
final resultsProvider = StateProvider((ref) => []);
final paginationProvider = StateProvider((ref) => 1);