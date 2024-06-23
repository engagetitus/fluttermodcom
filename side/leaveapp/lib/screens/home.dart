import 'package:flutter/material.dart';
import 'package:leaveapp/custom widgets/appbar.dart';
import 'package:leaveapp/screens/makeapplications.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: appbar(title: 'Leave Applications' ),
        body: const Column(
          children: [],),

         floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const Application()));
          },
          elevation: 0,
          
          child: const Icon(Icons.add_outlined),
          

         ), 

    );
  }
}