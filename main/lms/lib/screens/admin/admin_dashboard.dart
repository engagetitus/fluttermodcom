import 'package:flutter/material.dart';
import 'package:lms/screens/admin/addcourses.dart';
import 'package:lms/screens/admin/allcourses.dart';
import 'package:lms/screens/admin/reports.dart';
import 'package:lms/screens/trainors/attendance.dart';


class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton.filledTonal(onPressed: (){

            // Navigator.push(context, MaterialPageRoute(builder: (_)=> Profile(profile: profile,)));
          }, icon: const Icon(Icons.person_4_outlined))
        ],
        ),

        body: pages[currentIndex],

        

         bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
         onTap: (i){
            setState((){
              currentIndex = i;
            });
         }, 


        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.class_outlined), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.class_outlined), label: 'Classroom'),
        ]),
      
      );
  }
}

List<Widget>  pages = const [Reports(), CourseMaster(),  Attendance()];