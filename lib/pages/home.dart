import 'package:flutter/material.dart';

import 'package:repo_searcher/pages/results.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context){return Results();})
            );
          },        
          child: const Text("search"),
        ),



    );
  }
}