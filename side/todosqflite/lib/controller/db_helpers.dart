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