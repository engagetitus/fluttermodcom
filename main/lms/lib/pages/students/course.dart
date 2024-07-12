import 'package:flutter/material.dart';

import '../../data/courses.dart';

class Classwork extends StatelessWidget {
  const Classwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(mycourses.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(mycourses[index].name),
              const Text('Outline'),
              const Divider()
            ],
          ),
        );
      }),
    );
  }
}
