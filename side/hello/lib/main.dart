import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:hello/Calculator/calculator.dart';
import 'package:hello/profile/stateful.dart';
//import 'package:hello/profile/stateless.dart';
import 'package:hello/messages/messages2.dart';
import 'package:hello/resources/week1.dart';


void main() {
  runApp(MaterialApp(
    title: 'Hello Flutter',
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData.dark(useMaterial3: true),
    theme: ThemeData.light(useMaterial3: true),
    home: const MyWidget(),
  ));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Flutter Apps',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32.4,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Profile(),
                  ),
                );
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: Column(
        children: [
          
          
          
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Messages()));
            },
            child: const Text('Messages',
                style: TextStyle(fontSize: 25.2), textAlign: TextAlign.center),
          ),



          
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const Calculator()));
            },
            child: const Text('Calculator',
                style: TextStyle(fontSize: 25.2), textAlign: TextAlign.center),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 52, 37, 117),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Week1() )
          );
        },
        icon: const Icon(Icons.description),
        label: const Text('References'),
      ),
    );
  }
}
