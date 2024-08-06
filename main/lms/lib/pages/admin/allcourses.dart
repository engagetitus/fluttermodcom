import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lms/pages/admin/add_course.dart';

import '../../components/courses.dart';
import '../../controllers/firestore.dart';
import '../../models/courses.dart';

class CourseMaster extends StatefulWidget {
  const CourseMaster({super.key});

  @override
  State<CourseMaster> createState() => _CourseMasterState();
}

class _CourseMasterState extends State<CourseMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body, streambuilder
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Go create a Course
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const CreateCourse()));
        },
        child: const Icon(Icons.plus_one),
      ),
      body: const FetchCourses(
        isAdmin: true,
      ),
    );
  }
}
