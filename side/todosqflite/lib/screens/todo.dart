import 'package:flutter/material.dart';

import '../controller/db_helpers.dart';
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
      appBar: AppBar(title: const Text('TODO List')),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const AddPage()));
      }),
      body: FutureBuilder(
          future: retrieveTodos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length, // change to dynamic Later
                  itemBuilder: (context, index) {
                    var todo = snapshot.data![index];
                    return ListTile(
                      title: Text(todo['title'].toString()),
                      subtitle: Text(todo['description'].toString()),
                      trailing: Checkbox(
                          value: todo['isComplete'] == 1 ? true : false,
                          onChanged: (value) {}),
                    );
                  });
            }
          }),
    );
  }
}

void lewis() {}
