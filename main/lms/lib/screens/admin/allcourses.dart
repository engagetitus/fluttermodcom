import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lms/screens/admin/addcourses.dart';
import 'package:lms/screens/admin/allcourses.dart';

class CourseMaster extends StatefulWidget {
  const CourseMaster({super.key});

  @override
  State<CourseMaster> createState() => _CourseMasterState();
}

class _CourseMasterState extends State<CourseMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Master'),

      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> const CreateCourse()));
      }),
    );
  }
}

//Fetching from FIrebase
Stream<QuerySnapshot<Map<String, dynamic>>> getProfiles()  {
  return FirebaseFirestore.instance.collection('profiles').snapshots();
}

