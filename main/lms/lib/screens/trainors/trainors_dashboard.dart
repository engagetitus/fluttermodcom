import 'package:flutter/material.dart';
import 'package:lms/screens/trainors/analysis.dart';
import 'package:lms/screens/trainors/attendance.dart';


class TrainorsDashboard extends StatefulWidget {
  const TrainorsDashboard({super.key});

  @override
  State<TrainorsDashboard> createState() => _TrainorsDashboardState();
}

class _TrainorsDashboardState extends State<TrainorsDashboard> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainors Dashboard'),
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
          BottomNavigationBarItem(icon: Icon(Icons.class_outlined), label: 'Classroom'),
        ]),

      
      );
  }
}
List<Widget>  pages = const [Analysis(),  Attendance()];

