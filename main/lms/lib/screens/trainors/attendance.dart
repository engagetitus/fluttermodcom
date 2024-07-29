import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lms/models/users.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder(
        stream: getProfiles(), 
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.connectionState == ConnectionState.active){
            //We are getting data
            if(!snapshot.hasData || snapshot.data.docs.isEmpty){
              // No data
               return const Text('No Records found');
              
            }
            else{
              
              var documents = snapshot.data.docs;
              return UserCard(documents: documents);
             
            }
          }
          else{
            return const Text('Something went wrong');
          }
        },
    ));
  }
}

class UserCard extends StatelessWidget {
   const UserCard({
    super.key,
    required this.documents,
  });

   final dynamic documents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (context, index){
        
          var data = documents[index].data() as Map<String, dynamic>;
          Profile user = Profile.fromMap(data);
          return Text(user.fname);
      }
      );
  }
}

//Fetching from FIrebase
Stream<QuerySnapshot<Map<String, dynamic>>> getProfiles()  {
  return FirebaseFirestore.instance.collection('profiles').snapshots();
}