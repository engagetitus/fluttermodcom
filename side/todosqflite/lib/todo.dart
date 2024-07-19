import 'package:flutter/material.dart';

import 'add.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List')
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const AddPage()));
      }),
      body: ListView.builder(
          itemCount: 10, // change to dynamic Later
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Topic $index"),
              subtitle: const Text('Description'),
              trailing: Checkbox(value: true, onChanged: (value) {}),
            );
          }),
    );
  }
}

void lewis() {}
