import 'package:flutter/material.dart';
import 'package:todosql/controller/sql/db_helpers.dart';

class Addtasks extends StatefulWidget {
  const Addtasks({super.key});

  @override
  State<Addtasks> createState() => _AddtasksState();
}

class _AddtasksState extends State<Addtasks> {
  bool value = false;
  var formKey = GlobalKey<FormState>();
  var title = TextEditingController();
  var description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        title: const Center(
          child: Text('Create Tasks')
        ),
      ),

      body:
      Column(
          children:[
            Form(
              key: formKey,
              child: Column(
                children:[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                     controller: title, 
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Title is required';
                      }
                      return null;
                    },
                                    ),
                  ),
                
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: TextFormField(
                    controller: description,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Description is required';
                      }
                      return null;
                    },
                                   ),
                 ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Completed'),
                    Checkbox(value: value, onChanged: (v){
                      setState(() {
                        value = v!;
                      });
                    })
                  ],
                )

                
                ]
              ),
            ),
          ElevatedButton(onPressed: (){
            var isValid = formKey.currentState!.validate();
            if(isValid){
              insertToDoItem(title.text, description.text, value).then((v){
                Navigator.pop(context);
              });
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Form is okay')));
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Form contains errors')));
            }
          }, 
          
          
          child: const Text('Create'))


          ]
      ),
    );
  }
}