import 'package:flutter/material.dart';
import 'package:lms/models/courses.dart';

import '../../components/textfield.dart';
import '../../controllers/firestore.dart';

class CreateCourse extends StatelessWidget {
  const CreateCourse({super.key});
// class Courses {
//   final String id;

//   final String code;
//   final String name;
//   final String description;
//   final List<Resources> topics;
//   final DateTime createdAt;
//   final DateTime? updatedAt;
  @override
  Widget build(BuildContext context) {
    TextEditingController code = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController descr = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Course'),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //   final String code;
            customTextField('Course Code',
                hint: 'C013',
                controller: code,
                keyboardType: TextInputType.name,
                icon: Icons.code),
            spacing,
            //   final String name;
            customTextField('Course Name',
                hint: 'Flutter',
                controller: name,
                keyboardType: TextInputType.name,
                icon: Icons.book),
            //   final String description;
            spacing,
            customTextField('Course Desciption',
                hint: 'Work with Dart',
                controller: descr,
                keyboardType: TextInputType.multiline,
                icon: Icons.abc),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // create object
            Courses course = Courses(
                id: 'id',
                code: code.text.toUpperCase().trim(),
                name: name.text.trim(),
                description: descr.text,
                topics: [],
                createdAt: DateTime.now());
            // Save to Firebase
            saveCourseToFirestore(course).then((v) {
              Navigator.pop(context);
            });

            // Close page
          },
          label: const Text('Save')),
    );
  }
}
