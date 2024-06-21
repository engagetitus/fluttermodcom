import 'package:flutter/material.dart';

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
    validator: validator,
  );
}

String? validateUrl(String? value) {
  // Regular expression to validate a URL
  Pattern pattern = r'^(https?:\/\/)?' // Optional scheme. Either http or https.
      r"(([a-zA-Z0-9$-_.+!*\'(),]|%[0-9a-fA-F]{2})+@)?" // Optional user info.
      r'([a-zA-Z0-9.-]+)' // Hostname.
      r'(\.[a-zA-Z]{2,})' // Top-level domain.
      r'(:[0-9]{1,5})?' // Optional port.
      r'(\/.*)?$'; // Optional path.
  RegExp regex = RegExp(pattern as String);
  if (!regex.hasMatch(value ?? '')) {
    return 'Enter a valid URL';
  } else {
    return null;
  }
}

Container spacing = Container(
  height: 10,
);
