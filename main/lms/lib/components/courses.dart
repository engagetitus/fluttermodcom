// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controllers/firestore.dart';
import '../models/courses.dart';

class FetchCourses extends StatelessWidget {
  final bool isAdmin;
  const FetchCourses({
    Key? key,
    required this.isAdmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getCourses(),
        builder: (context, AsyncSnapshot snapshot) {
          // This is not different from future buider
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            // We know we are already getting some data.
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              // we dont have data
              return const Text('No Records Found');
            } else {
              var documents = snapshot
                  .data!.docs; // The Snapshots everything in the collecytion
              return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    var data = documents[index].data() as Map<String, dynamic>;
                    // convert to model for consistency
                    Courses courses = Courses.fromMap(data);
                    return CourseCard(
                      courses: courses,
                      isAdmin: isAdmin,
                    );
                  });
              // we  have data
            }
          } else {
            return const Text('Something wrong happened');
          }
        });
  }
}

class CourseCard extends StatelessWidget {
  final bool isAdmin;
  const CourseCard({
    Key? key,
    required this.isAdmin,
    required this.courses,
  }) : super(key: key);

  final Courses courses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(courses.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(courses.description),
            Align(
              alignment: Alignment.bottomRight,
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${courses.topics.length} Topics'),
              )),
            )
          ],
        ),
        trailing: isAdmin
            ? IconButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('courses')
                      .doc(courses.id)
                      .delete();
                },
                icon: const Icon(Icons.delete_rounded))
            : null,
      ),
    );
  }
}
