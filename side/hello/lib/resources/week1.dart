import 'package:flutter/material.dart';
//import 'package:hello/main.dart';
import 'package:hello/resources/week2.dart';


class Week1 extends StatelessWidget {
  const Week1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 1', style: TextStyle(fontSize: 25.2)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const Week2()));
        },
        label: const Text('Week2'),


      ),
    );
  }
}
