import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lms/pages/auth/signup.dart';

import 'login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: GestureDetector(
        onTap: () {
          // Navigate
          // stacking pages

          // pushReplacement removes the page from the stack
          // - same as finish() in kkotlin
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * .1,
          child: Center(
              child: Text('Get Started',
                  style: Theme.of(context).textTheme.titleLarge)),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/logo/modcom.png',
        ),
        Text(
          'Learning Management System',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(FirebaseAuth.instance.currentUser!.email ?? 'none'),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      // ignore: prefer_const_constructors
                      context,
                      MaterialPageRoute(builder: (_) => const Login()));
                },
                child: const Text('LOGIN')),
            TextButton(
                onPressed: () => Navigator.pushReplacement(
                    // ignore: prefer_const_constructors
                    context,
                    MaterialPageRoute(builder: (_) => const SignUp())),
                child: const Text('Create Account')),
          ],
        )
      ]),
    );
  }
}
