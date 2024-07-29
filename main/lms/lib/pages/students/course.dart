import 'package:flutter/material.dart';

import '../../components/courses.dart';

class Classwork extends StatelessWidget {
  const Classwork({super.key});

  @override
  Widget build(BuildContext context) {
    return const FetchCourses(
      isAdmin: false,
    );
  }
}
