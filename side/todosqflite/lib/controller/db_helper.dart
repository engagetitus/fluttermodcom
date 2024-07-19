// SQFLITE

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> initializeDB() async {
  // get directory
  String path = await getDatabasesPath();
  return openDatabase(
    join(path, 'todo.db'),
    onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, isComplete INTEGER)");
    },
    version: 1,
  );
}
