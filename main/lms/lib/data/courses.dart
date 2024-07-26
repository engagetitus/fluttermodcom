import '../models/courses.dart';

var courses = ["Data Science", "Flutter", "Mern", "Software Development"];

// List of Labs. - Lab1
var labs = List.generate(9, (index) => 'Lab ${index + 1}');

var levels = ["Beginner", "Intermediate", "Advanced"];

Map courseinfo = {};

List<Courses> mycourses = [
  Courses(
      id: 'id',
      code: 'code',
      name: 'Data Science',
      description: 'python',
      topics: [],
      createdAt: DateTime.now()),
  Courses(
      id: 'id',
      code: 'code',
      name: 'Flutter',
      description: 'dart',
      topics: [],
      createdAt: DateTime.now()),
  Courses(
      id: 'id',
      code: 'code',
      name: 'Mern',
      description: 'js',
      topics: [],
      createdAt: DateTime.now()),
  Courses(
      id: 'id',
      code: 'code',
      name: 'Software Development',
      description: 'python',
      topics: [],
      createdAt: DateTime.now())
];
