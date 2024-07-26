// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lms/pages/admin/allcourses.dart';
import 'package:lms/pages/admin/reports.dart';
import 'package:lms/pages/profile.dart';

import '../trainers/attendance.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({
    super.key,
  });

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int currentIndex = 1;

  List<Widget> pages = [
    const Reports(),
    const CourseMaster(),
    const Attandance()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
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
                icon: Icon(
                  Icons.bolt,
                ),
                label: 'Courses'),
            BottomNavigationBarItem(
                icon: Icon(Icons.class_outlined), label: 'Classroom')
          ]),
    );
  }
}
