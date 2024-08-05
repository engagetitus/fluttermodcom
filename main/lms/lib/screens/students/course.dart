import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lms/models/courses.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: getcourses(), 
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          else if(snapshot.connectionState == ConnectionState.active){
            if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
              return const Text('Nothing was found');
            }
            else{
              var documents = snapshot.data.docs;
            if(documents == null){
              return const Text("No courses found");
            }
            else{
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index){
                  var data = documents[index].data() as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      elevation: 20,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(index == 0 ? '' : index.toString(),
                        )),
                        title: Text(data['Course name'].toString()),
                        subtitle: Text(data['Course Description']),
                    
                    
                      ),
                    ),
                  );
                  
              });
            }

            }


            
            

            

          }
          else{
            return Text(snapshot.error.toString());
          }
        })
    );
  }
}

Stream getcourses(){
 
  return FirebaseFirestore.instance.collection('courses').snapshots();
}