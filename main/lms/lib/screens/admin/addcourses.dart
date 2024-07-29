
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lms/components/textfield.dart';
import 'package:lms/models/courses.dart';

class CreateCourse extends StatelessWidget {
  const CreateCourse({super.key});

  @override
  Widget build(BuildContext context) {
    var code = TextEditingController();
     var name = TextEditingController();
      var descr = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Course'),
      ),
      body: SafeArea(
        child: Form(child: 
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: customTextFormField(
                keyboardType: TextInputType.name, 
                controller: code, 
                labelText: 'Course Code', 
                hintText: 'e.g. H456RTW', 
                prefixIcon: const Icon(Icons.code), ),
            ),
        
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: customTextFormField(
                keyboardType: TextInputType.name, 
                controller: name, 
                labelText: 'Course Name', 
                hintText: 'e.g. Flutter', 
                prefixIcon: const Icon(Icons.book), ),
              ),
        
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: customTextFormField(
                keyboardType: TextInputType.multiline, 
                controller: descr, 
                labelText: 'Course Description', 
                hintText: 'e.g. H456RTW', 
                prefixIcon: const Icon(Icons.code), ),
              )
          ],
        )),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          
            Courses course = Courses(
              id: 'id', 
              code: code.text, 
              name: name.text, 
              description: descr.text, 
              topics: [], 
              createdAt: DateTime.now()
              );
              saveCoursestoFireStore(course);

              Navigator.pop(context);
        
      },

    label: const Text('Save'),
      ),

    );
  }
}

Future saveCoursestoFireStore(Courses course)async{
  return await FirebaseFirestore.instance.collection('courses').doc().set(course.toMap());
}