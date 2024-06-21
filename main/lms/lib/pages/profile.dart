// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.profile,
    required this.github,
    required this.address,
    required this.classes,
    required this.course,
  });
  final String name;
  final String email;
  final String phone;
  final String profile;
  final String github;
  final String address;
  final String classes;
  final String course;

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
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(profile),
              ),
            ),
            Text(name),
            Row(
              children: [
                const Icon(Icons.email),
                Expanded(child: Text(email)),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.code_off),
                Expanded(child: Text(github)),
              ],
            ),
            Text("Class $classes"),
            Text("Course $course"),
            Text("Address \n $address")
          ],
        ),
      ),
    );
  }
}
