import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/custom widgets/custom.dart';
//import 'package:todoapp/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(preferredSize: Size.fromHeight(10.0), 
                  child: Padding(padding: EdgeInsets.only(bottom: 12.0))),

        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/download.jpeg'),
          radius: 2.0,
        ),

        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('David Wamiti', style: TextStyle(fontSize: 30.0),),
            Text('david1@gmail.com', style: TextStyle(fontSize: 12.0))
          ],
        ),

        actions: const [Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(Icons.search),
        )],
      ),

      body:  Column(
        

        children: [
          customIconButton(Icons.wb_sunny_outlined, 
          (){
            
          }, 
          'To Do'),

          customIconButton(Icons.star_border_outlined, 
          (){
            
          }, 
          'Important'),

          customIconButton(Icons.list_outlined, 
          (){
            
          }, 
          'Planned'),

          customIconButton(Icons.all_inclusive_outlined, 
          (){
            
          }, 
          'All'),


         customIconButton(Icons.check_circle_outline, 
          (){
            
          }, 
          'Completed'),


          customIconButton(Icons.person_outline, 
          (){
            
          }, 
          'Assigned to me'),

          customIconButton(Icons.house_outlined, 
          (){
            
          }, 
          'Tasks'),

        




        ],



      ),

      
      


    );
  }
}