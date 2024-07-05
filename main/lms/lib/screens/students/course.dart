import 'package:flutter/material.dart';
import 'package:lms/models/courses.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
    List.generate(mycourses.length, (index){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(mycourses[index].name),
        Text(mycourses[index].description),
        const Divider()
      ],
      );
    })
      
    );
  }
}