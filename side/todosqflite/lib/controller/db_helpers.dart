// Have functions interacting with the local db

// we neeed to initailaize the database

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// INITIALIZING DB
Future<Database> initializeDB() async {
  String path = await getDatabasesPath();

  return openDatabase(
    join(path, 'todo.db'),
    version: 1,
    onCreate: (db, version) async {
      // creating the db structure
      await db.execute(
          "CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, isComplete INTEGER)");
    },
  );
}

// BASIC USAGE - CREATE READ UPDATE DELETE
// CREATE
Future insertTodoItem(String title, String decription, bool isComplete) async {
  // initialize the db
  Database db = await initializeDB();
  // create method
  await db.insert('todos', {
    'title': title,
    'description': decription,
    'isComplete': isComplete ? 1 : 0
  });
}

// Read
Future<List<Map<String, Object?>>> retrieveTodos() async {
  Database db = await initializeDB();
  return await db.query('todos');
}

Future<List<Map<String, Object?>>> filterTodos(bool isComplete) async {
  Database db = await initializeDB();
  return await db
      .query('todos', where: 'isComplete = ?', whereArgs: [isComplete ? 1 : 0]);
}

// Update 