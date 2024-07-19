import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//Have functions that interact with the local database

//Initialize the database

Future<Database> initializeDB() async{
  String path = await getDatabasesPath();
  return openDatabase(join(path, 'todo.db'),
  version: 1,
  onCreate: (db,version) async{
    await db.execute("CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, isComplete INTEGER)");
  },
  ); 
}

// BASIC USAGE - CREATE, READ, UPDATE, DELETE
Future insertToDoItem(String title, String description, bool isComplete) async{
  Database db = await initializeDB();
  //create method
  await db.insert(
    'todos',
    {
      'title' : title,
      'description': description,
      'isComplete': isComplete ? 1 : 0
    }
  );
}

Future<List<Map<String, Object?>>> retrieveTodos() async{
  Database db = await initializeDB();
  return await db.query('todos' );
}

Future<List<Map<String, Object?>>> filterTodos(bool complete) async{
  Database db = await initializeDB();
  return await db.query('todos', where: 'isComplete = ?', whereArgs: [complete ? 1:0] );
}

