import 'dart:async';

import 'package:ofcriverpod/database/user_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseService {
  Database? _database;

  Future<Database> get database async{
    if(_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }
  
  Future<String> get fullPath async {
    const name = 'usernew.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async{

    final path = await fullPath;
    var database = await openDatabase(
        path,
        version: 2,
        onCreate: create,
         singleInstance: true);
    return database;

  }
  
  FutureOr<void> create(Database database, int version) async{
    await UserDB().createTable(database);
  }
}