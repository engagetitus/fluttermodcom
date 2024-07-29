// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lms/pages/profile.dart';
import 'package:lms/pages/trainers/analysis.dart';
import 'package:lms/pages/trainers/attendance.dart';

import '../students/student_dashboard.dart';

class TrainerDashboard extends StatefulWidget {
  const TrainerDashboard({
    super.key,
  });

  @override
  State<TrainerDashboard> createState() => _TrainerDashboardState();
}

class _TrainerDashboardState extends State<TrainerDashboard> {
  int currentIndex = 1;

  List<Widget> pages = [
    const DummyDashboard(
      items: ['Lesson Plans', 'Calendar', 'ToT', 'Feedback', 'Tasks'],
    ),
    const Attandance()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainer Dashboard'),
        actions: [
          IconButton.filledTonal(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Profile()));
              },
              icon: const Icon(Icons.person_4_outlined))
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (i) {
            setState(() {
              currentIndex = i;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.class_outlined), label: 'Classroom')
          ]),
    );
  }
}
