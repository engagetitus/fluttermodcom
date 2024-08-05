import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List tiles = ['Trainers', 'Students', 'Licences', 'Parents', 'Feedback'];
class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ),
        itemCount: tiles.length,
        itemBuilder: (context, index){
          return Card(
            color: Colors.grey,
            elevation: 20,
            child: Center(child: Text(tiles[index], style: const TextStyle(color: Colors.black),)),
          );

        }),

    );
  }
}