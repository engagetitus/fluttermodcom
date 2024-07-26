import 'package:flutter/material.dart';

import '../controller/db_helpers.dart';
import '../models/todo_model.dart';
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
                    Task todos = Task.fromDB(todo);

                    return Dismissible(
                        background: Container(
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.delete_forever),
                            ],
                          ),
                        ),
                        secondaryBackground: Container(
                          alignment: Alignment.centerLeft,
                          color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.edit),
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            deleteItem(todos.id);
                          } else {
                            updateItem(todos.id, 'New Name', 'New Description');
                          }
                        },
                        key: Key(todos.toString()),
                        child: ListTile(
                          title: Text(todos.title),
                          subtitle: Text(todos.description),
                          trailing: Checkbox(
                              value: todos.isComplete, onChanged: (value) {}),
                        ));
                  });
            }
          }),
    );
  }
}

void lewis() {}
