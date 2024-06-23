import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


Padding customIconButton(
  IconData icon,
  void Function()? onPressed,
  String text,



){
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: GestureDetector(
      onTap: onPressed,
      child: Row(
      children: [
        Expanded(
          flex: 1,
        child:  Icon(icon),
        ),
      
        Expanded(
          flex: 5,
        child: Text(text)
        
        ),
        
        
        ],
        ),
    ),

    );
}