import 'package:flutter/material.dart';

class Statements extends StatefulWidget {
  const Statements({super.key});

  @override
  State<Statements> createState() => _StatementsState();
}

class _StatementsState extends State<Statements> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(10, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('Statement $index'), Text('Details'), Divider()],
          ),
        );
      }),
    );
  }
}
