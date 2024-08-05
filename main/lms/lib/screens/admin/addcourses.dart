
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lms/components/textfield.dart';
import 'package:lms/models/courses.dart';

class CreateCourse extends StatefulWidget {

  const CreateCourse({super.key});

  @override
  State<CreateCourse> createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  final formKey = GlobalKey<FormState>();
  var code = TextEditingController();
  var name = TextEditingController();
  var descr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Course'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: 
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: customTextFormField(
                    keyboardType: TextInputType.name, 
                    controller: code, 
                    labelText: 'Course Code', 
                    hintText: 'e.g. H456RTW', 
                    prefixIcon: const Icon(Icons.code), 
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Course Code is required';
                      }
                      else{
                        return null;
                      }
                    },
                    ),
                ),
            
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: customTextFormField(
                    keyboardType: TextInputType.name, 
                    controller: name, 
                    labelText: 'Course Name', 
                    hintText: 'e.g. Flutter course', 
                    prefixIcon: const Icon(Icons.book), 
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Course Code is required';
                      }
                      else{
                        return null;
                      }
                    },
                    ),
                    
                  ),
            
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: customTextFormField(
                    keyboardType: TextInputType.multiline, 
                    controller: descr, 
                    labelText: 'Course Description', 
                    hintText: 'e.g. Cross-Platform Development', 
                    prefixIcon: const Icon(Icons.code), 
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Course Code is required';
                      }
                      else{
                        return null;
                      }
                    },
                    ),
                  )
              ],
            )),
        



          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()async{
          var isValid = formKey.currentState!.validate();
          if(isValid){
            try{
                    
              await saveCoursestoFireStore(
                map: 
                {
                'Course name' : name.text,
                'Course code': code.text,
                'Course Description': descr.text
              },
              names : name.text
              );
            

              //Navigator.pop(context);
            }
            catch(e){
             print(e);
            }
          }

          else{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Check your fields')));
          }
          
        
      },

    label: const Text('Save'),
      ),

    );
  }
}

Future saveCoursestoFireStore({required Map<String, dynamic> map, required String names})async{
  return await FirebaseFirestore.instance.collection('courses').doc(names).set(map);
}