import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final title = TextEditingController();
  final desc = TextEditingController();
  bool completed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          child: Column(children: [
        // textfields -title , description
        TextFormField(
          controller: title,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        TextFormField(
          controller: desc,
          decoration: const InputDecoration(labelText: 'Description'),
        ),
        CheckboxListTile(
            title: const Text('Is Task Completed?'),
            value: completed,
            onChanged: (value) {
              setState(() {
                completed = value!;
              });
            }),

        OutlinedButton(
            onPressed: () {
             
            },
            child: const Text('Save'))
      ])),
    );
  }
}

Future saveData(String title, description, bool completed) async {}
