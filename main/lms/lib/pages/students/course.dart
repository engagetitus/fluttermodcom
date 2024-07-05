import 'package:flutter/material.dart';

class Classwork extends StatelessWidget {
  const Classwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(10, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('Course $index'), Text('Outline'), Divider()],
          ),
        );
      }),
    );
  }
}
