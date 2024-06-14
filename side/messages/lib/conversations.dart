import 'package:flutter/material.dart';

class Conversations extends StatefulWidget {
  const Conversations({super.key});

  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  @override
  Widget build(BuildContext context) {
    String name = "David";
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(name),
          ],
        ),
      ),
    );
  }
}
