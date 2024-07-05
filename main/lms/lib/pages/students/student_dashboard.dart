// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lms/pages/profile.dart';
import 'package:lms/pages/students/course.dart';
import 'package:lms/pages/students/fee_statement.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({
    super.key,
    required this.profile,
  });
  final Map<String, dynamic> profile;

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Dashboard'),
          actions: [
            IconButton.filledTonal(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Profile(
                                profile: widget.profile,
                              )));
                },
                icon: const Icon(Icons.person_4_outlined))
          ],
        ),

        // bottom Navigationbar
        bottomNavigationBar: BottomNavigationBar(
            // handle change
            onTap: (index) {
              // set new index
              setState(() {
                current_index = index;
              });
            },
            currentIndex: current_index,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.class_), label: 'Course'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt), label: 'Statements')
            ]),
        body: pages[current_index]);
  }

  List<Widget> pages = [
    const Text(
      'Home Page',
      style: TextStyle(fontSize: 50),
    ),
    const Classwork(),
    const Statements()
  ];
}
