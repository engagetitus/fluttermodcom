import 'package:flutter/material.dart';
import '../profile.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key, required this.profile});
  final Map<String,dynamic> profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Admin Dashboard'),),
        actions: [
          IconButton.filledTonal(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (_)=> Profile(profile: profile,)));
          }, icon: const Icon(Icons.person_4_outlined))
        ],
        ),
      
      );
  }
}