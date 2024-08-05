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
     
    
    body: StreamBuilder(
      stream: getcourses(), 
      builder: (context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();

        }
        else if(snapshot.connectionState == ConnectionState.active){
          if(!snapshot.hasData || snapshot.data.docs.isEmpty){
            return const Text('No records found');
          }
          else{
            var data = snapshot.data.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index){
                return Card(
                  elevation: 20,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:[ ListTile(
                      title: Text(data[index].data()['Course name']),
                      subtitle: Text(data[index].data()['Course Description']),
                      trailing: IconButton(onPressed: (){
                        deletecourses(data[index].data()['Course name']);
                      }, icon: const Icon(Icons.delete)),
                    ),
                      const Positioned(
                        bottom: 0,
                        right: 80,
                        child:  Card( 
                          elevation: 80,
                          color: Colors.grey,
                          child:  Text('0 Topics')),
                      )

                    ]
                  ),
                );
              }
              
              
              );
          }
        }
        else{
          return const Text('An error occurred');
        }
      }
      
      ),

     floatingActionButton: FloatingActionButton.extended(
          label: const Text('Add Course'),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const CreateCourse()));
          }),
    );
  }
}

//Fetching from FIrebase
Stream<QuerySnapshot<Map<String, dynamic>>> getProfiles()  {
  return FirebaseFirestore.instance.collection('profiles').snapshots();
}

Stream <QuerySnapshot<Map<String, dynamic>>> getcourses(){
  return FirebaseFirestore.instance.collection('courses').snapshots();
}

Future deletecourses(String document)async{
  await FirebaseFirestore.instance.collection('courses').doc(document).delete();
}

