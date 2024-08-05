import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



List tiles = ['Lesson Plans', 'Calendar', 'ToT', 'Feedback', 'Tasks'];
class Analysis extends StatefulWidget {
  const Analysis({super.key});

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GridView.builder(
        itemCount: tiles.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
        itemBuilder: (context, index){
            return Card(
              color: Colors.grey,
              elevation: 20,
              child: Center(child: Text(tiles[index], style: const TextStyle(color: Colors.black),),),
            );
        })
    );
  }
}