import 'package:flutter/material.dart';
import 'package:todoapp/home.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: FlexThemeData.light(scheme: FlexScheme.hippieBlue),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.hippieBlue, darkIsTrueBlack: true),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}



