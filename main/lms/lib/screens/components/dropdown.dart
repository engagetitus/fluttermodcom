import 'package:flutter/material.dart';

var courses = [
  "Data Science",
  "Flutter Programming",
  "Mern",
  "Software Development",
];

// List of labs
// List<String> labList() {
//   return List<String>.generate(9, (index) => 'Lab ${index + 1}');
// }

var labz = List.generate(9, (index) => 'Lab ${index + 1}');

// var labs = [
//   "Lab 1",
//   "Lab 2",
//   "Lab 3",
//   "Lab 4",
//   "Lab 5",
//   "Lab 6",
//   "Lab 7",
//   "Lab 8",
//   "Lab 9",
// ];

DropdownButtonFormField customDrop(String input, String selected,
    List<String> list, Function(dynamic)? setValue) {
  return DropdownButtonFormField(
      isExpanded: true,
      enableFeedback: true,
      value: selected,
      items: courses.map((String item) {
        return DropdownMenuItem(
            alignment: Alignment.centerRight,
            enabled: selected != item,
            value: item,
            child: Text(item));
      }).toList(),
      onChanged: setValue);
}
