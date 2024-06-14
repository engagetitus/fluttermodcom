import 'package:flutter/material.dart';
//import 'package:hello/resources/week1.dart';

class Week2 extends StatelessWidget {
  const Week2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 2', style: TextStyle(fontSize: 25.2)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      
    );
  }
}