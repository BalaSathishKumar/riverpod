import 'package:sqflite/sqflite.dart';

import '../models/userReponseModel.dart';
import 'database_service.dart';




class UserDB {
  final tableName = "newusers";
  
  Future<void> createTable(Database databse)async { //  PRIMARY KEY("id" AUTOINCREMENT)

    await databse.execute('''
    CREATE TABLE IF NOT EXISTS $tableName (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "reponame" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "stars" TEXT NOT NULL,
    PRIMARY KEY("id" AUTOINCREMENT)
   )
   ''');
  }

  Future<int> create({required userResonseModel usermodel}) async {

    final database = await DatabaseService().database;
    return await database.rawInsert('''INSERT INTO $tableName (id,name,reponame,description,stars) VALUES (?,?,?,?,?)''',
      [usermodel.id,usermodel.name,usermodel.reponame,usermodel.description,usermodel.stars]);
  }

 Future<List<userResonseModel>> fetchAll() async {
    final database = await DatabaseService().database;
    final users = await database.rawQuery(
      '''SELECT * from $tableName ORDER BY COALESCE(id,name)''');
    return users.map((user) => userResonseModel.fromSqfliteDatabase(user)).toList();

 }
  
}