import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       hintText: 'example@gmail.com',
//                       prefixIcon: Icon(Icons.email),
//                       border: OutlineInputBorder(),
//                     ),
//                     keyboardType: TextInputType.emailAddress),
//               )

TextFormField customTextField(
  String label, {
  required String hint,
  required TextEditingController controller,
  required TextInputType keyboardType,
  required IconData icon,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder()),
  );
}