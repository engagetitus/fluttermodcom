import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String course;
  final String lab;
  final String profileImage;
  final String github;
  final String address;

  const ProfileScreen({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.course,
    required this.lab,
    required this.profileImage,
    required this.github,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            if (profileImage.isNotEmpty) Image.network(profileImage),
            Text('First Name: $firstname'),
            Text('Last Name: $lastname'),
            Text('Email: $email'),
            Text('Phone Number: $phone'),
            Text('Current Course: $course'),
            Text('Lab: $lab'),
            Text('GitHub: $github'),
            Text('Adress: $address'),
          ],
        ),
      ),
    );
  }
}
