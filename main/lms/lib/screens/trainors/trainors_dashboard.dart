import 'package:flutter/material.dart';
import '../profile.dart';

class TrainorsDashboard extends StatelessWidget {
  const TrainorsDashboard({super.key, required this.profile});
  final Map<String,dynamic> profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Trainors Dashboard'),),
        actions: [
          IconButton.filledTonal(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (_)=> Profile(profile: profile,)));
          }, icon: const Icon(Icons.person_4_outlined))
        ],
        ),
      
      );
  }
}