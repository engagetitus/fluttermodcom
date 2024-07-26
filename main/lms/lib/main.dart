import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lms/pages/students/student_dashboard.dart';

import 'firebase_options.dart';
import 'pages/admin/admin_dashboard.dart';
import 'pages/auth/welcome.dart';
import 'pages/trainers/trainers_dashboard.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // binds up all resources before building Material app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: user == null ? const Home() : const AdminDashboard(),
    );
  }
}
