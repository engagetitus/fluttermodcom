// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center(
            //   child: CircleAvatar(
            //     radius: 40,
            //     backgroundImage: NetworkImage(profile['profile']),
            //   ),
            // ),
            Text("profile['name']"),
            Row(
              children: [
                const Icon(Icons.email),
                Expanded(child: Text("profile['email']")),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.code_off),
                Expanded(child: Text("profile['github']")),
              ],
            ),
            Text("Class {profile['classes']}"),
            Text("Course {profile['course']}"),
            Text("Address \n profile['address']")
          ],
        ),
      ),
    );
  }
}
