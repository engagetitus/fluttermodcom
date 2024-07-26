import 'package:flutter/material.dart';


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
