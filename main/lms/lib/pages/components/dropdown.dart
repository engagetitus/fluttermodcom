import 'package:flutter/material.dart';

var courses = ["Data Science", "Flutter", "Mern", "Software Development"];

// List of Labs. - Lab1
var labs = List.generate(9, (index) => 'Lab ${index + 1}');

var gender = [
  "Company",
  "male",
  "Female",
];
var levels = ["Beginner", "Intermediate", "Advanced"];

// ElevatedButton(onPressed: () {}, child: Text("Elevated")),
//           OutlinedButton(onPressed: () {}, child: Text("Outlined")),
//           DropdownButton(
//               isExpanded: true,
//               value: selectedgender,
//               items: gender.map((String item) {
//                 return DropdownMenuItem(
//                   child: Text(item),
//                   value: item,
//                 );
//               }).toList(),
//               onChanged: (String? item) {
//                 setState(() {
//                   // saving the selection
//                   selectedgender = item!;
//                 });
//               }),

DropdownButtonFormField customDrop(String input, String selected,
    List<String> list, Function(dynamic)? setValue) {
  return DropdownButtonFormField(
      isExpanded: true,
      hint: Text("select $input"),
      enableFeedback: true,
      value: selected,
      items: list.map((String item) {
        return DropdownMenuItem(
            alignment: Alignment.centerLeft,
            enabled: selected != item,
            value: item,
            child: Text(item));
      }).toList(),
      onChanged: setValue);
}
