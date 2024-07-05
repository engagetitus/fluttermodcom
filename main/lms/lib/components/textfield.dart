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
  required TextEditingController? controller
}){

  return Padding(
    padding: const EdgeInsets.all(15.0), 
    child: TextField(
      controller: controller,
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

TextFormField customTextFormField({
  required TextInputType? keyboardType,
  required TextEditingController? controller,
  String? Function(String?)? validator,
  required String? labelText,
  required String? hintText,
  required Icon? prefixIcon,
  required InputBorder? border,
  Function(String)? onChanged  


})


{

  return  TextFormField(
      onChanged: (String? value){},
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: border,
      ),

      keyboardType: keyboardType,


  );
    
}




