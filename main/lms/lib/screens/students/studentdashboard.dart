import 'package:flutter/material.dart';
import 'package:lms/screens/students/course.dart';
import 'package:lms/screens/students/fee_statement.dart';
import '../profile.dart';

class Studentdashboard extends StatefulWidget {
  const Studentdashboard({super.key, 
  //required this.profile
  });
  //final Map<String,dynamic> profile;
  

  @override
  State<Studentdashboard> createState() => _StudentdashboardState();
}

class _StudentdashboardState extends State<Studentdashboard> {
  int selectedTap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


  appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Student Dashboard'),
        actions: [
          IconButton.filledTonal(onPressed: (){

            // Navigator.push(context, MaterialPageRoute(builder: (_)=> Profile(profile: widget.profile,)));
          }, icon: const Icon(Icons.person_4_outlined))
        ],
        ),

body: pages[selectedTap],
      bottomNavigationBar: BottomNavigationBar(
          onTap : (index){
            setState(() {
              selectedTap = index;
            });
          },
          currentIndex: selectedTap,

        items: const [
          //handle change
          

          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.class_), label: 'Course'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Statements')          
          ],
      ),



     
      
      );
  }
}

List <Widget> pages = [
  const Center(child: Text('Home'),),
  const Courses(),
  const Statements(),
];