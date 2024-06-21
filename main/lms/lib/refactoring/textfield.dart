import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';

//Custom Text Field
Padding  customTextField({
  required String? labelText,
  required String? hintText,
  required Icon? prefixIcon,
  required InputBorder? border,
  required TextInputType? keyboardType,
}){

  return Padding(
    padding: const EdgeInsets.all(15.0), 
    child: TextField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: border,

      ),

      keyboardType: keyboardType,


      ),
    );

}

Padding customTextFormField({
  required TextInputType? keyboardType,
  required TextEditingController? controller,
  required String? Function(String?)? validator,

}){

  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextFormField(
      validator: (value){
        return validator!(value);
      },


    ),
  )   ;
}


