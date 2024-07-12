import 'package:flutter/material.dart';

class Oneproduct extends StatefulWidget {
  const Oneproduct({super.key, required this.oneproduct});
  final List oneproduct;
  @override
  State<Oneproduct> createState() => _OneproductState();
}

class _OneproductState extends State<Oneproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListTile(
        title: Text(widget.oneproduct[0][1]),
        subtitle: Text(widget.oneproduct[0][2]),
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://soko.titus.co.ke/static/images/${widget.oneproduct[0][5]}'),
        ),
      ),


    );
  }
}