import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lms/pages/auth/signup.dart';

import '../../data/users.dart';
import '../admin/admin_dashboard.dart';
import '../students/student_dashboard.dart';
import '../trainers/trainers_dashboard.dart';
import 'login.dart';

class Portals extends StatefulWidget {
  const Portals({super.key});

  @override
  State<Portals> createState() => _PortalsState();
}

class _PortalsState extends State<Portals> {
  String? role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: GestureDetector(
        onTap: () {
          navigate(context, role);
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * .1,
          child: Center(
              child: Text('Explore',
                  style: Theme.of(context).textTheme.titleLarge)),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .4,
          child: Image.asset(
            'assets/logo/modcom.png',
          ),
        ),
        Text(
          'Learning Management System',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'USERNAME ${FirebaseAuth.instance.currentUser!.email}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Column(
          children: List<Widget>.generate(roles.length, (index) {
            return RadioListTile(
              title: Text(roles[index]),
              value: roles[index],
              groupValue: role,
              onChanged: (String? value) {
                setState(() {
                  role = value;
                });
              },
            );
          }),
          //  [
          //
          // ],
        ),
      ]),
    );
  }
}

void navigate(BuildContext context, String? role) {
  if (role == roles[0]) {
    // student
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => StudentDashboard()));
  } else if (role == roles[1]) {
    // Trainer
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => TrainerDashboard()));
  } else if (role == roles[2]) {
    // Trainer
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => AdminDashboard()));
  } else {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => StudentDashboard()));
    //admin
    const snackBar = SnackBar(
      behavior: SnackBarBehavior.fixed,
      content: Text("Signed In, No Role"),
      backgroundColor: Color.fromARGB(
        255,
        17,
        69,
        158,
      ),
      showCloseIcon: false,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
