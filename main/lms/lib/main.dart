import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lms/screens/admin/admin_dashboard.dart';
// import 'package:lms/screens/auth/login.dart';
import 'package:lms/screens/auth/welcome.dart';
import 'package:lms/screens/students/studentdashboard.dart';
import 'package:lms/screens/trainors/trainors_dashboard.dart';
//import 'package:lms/screens/signup.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  //Binds up all resources before building the MaterialApp
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      title: 'Learning Management System',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: user == null ? const Home() : const Studentdashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}



