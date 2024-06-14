import 'package:flutter/material.dart';
import 'package:hello/resources/week2.dart';

class Week1 extends StatelessWidget {
  const Week1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Week 1"),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // GO TO WEEK 1 Notes
            Navigator.push(context, MaterialPageRoute(builder: (_) => Week2()));
          },
          label: Text("Week2")),
    );
  }
}
