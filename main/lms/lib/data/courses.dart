import '../models/courses.dart';

var courses = ["Data Science", "Flutter", "Mern", "Software Development"];

// List of Labs. - Lab1
var labs = List.generate(9, (index) => 'Lab ${index + 1}');

var levels = ["Beginner", "Intermediate", "Advanced"];

Map courseinfo = {};

List<Courses> mycourses = [
  Courses('code', "Data Science", 'python'),
  Courses('code', "Flutter", 'python'),
  Courses('code', "Mern", 'python'),
  Courses('code', "Software Development", 'python'),
];
