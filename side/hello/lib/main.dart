import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello/calculator/calculator.dart';
import 'package:hello/messages/messages.dart';
import 'package:hello/resources/week1.dart';

import 'profile/stateful.dart';

void main() {
  // the main function
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Flutter',
      home: MyWidget()));
}

// Creating Our first Widget.
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculator

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text("Flutter Apps"),
        actions: [
          IconButton(
              onPressed: () {
                // Navigate to Profile
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Profile()));
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: Column(
        children: [
          // "TASK 2 : List Projects here and Navigate to them (Calculator,Messages)",

          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Calculator()));
            },
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Calculator",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 25),
                ),
                Text("Rows and Columns Challenge")
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Messages()));
            },
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Messages",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 25),
                ),
                Text("Rows and Columns Challenge 2")
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            //TASK1 GO TO WEEK 1 Notes
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Week1()));
          },
          label: const Text("References")),
    );
  }
}
