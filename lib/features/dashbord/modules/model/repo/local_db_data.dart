import 'package:flutter_application_1/features/dashboard/modules/model/entity/service_model.dart';
import 'package:flutter_application_1/features/dashboard/modules/model/repo/parent_data.dart';
import 'package:flutter_application_1/features/dashboard/modules/model/entity/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo  {
  DatabaseRepo._init();

  static DatabaseRepo? _singletoneObject;
  static late Database _database;

  static Future<DatabaseRepo> get instance async {
    if (_singletoneObject == null) {
      await _initDatabase();
      _singletoneObject = DatabaseRepo._init();
    }
    return _singletoneObject!;
  }

  ///create database
  static Future<void> _initDatabase() async {
    ///get database path on the target device
    final String databasePath = await getDatabasesPath();

    ///add your database files
    final String path = databasePath + "/users.db";
    // final path = join(databasePath, 'users.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  static Future<void> _createTables(Database db, _) async {
    await db.execute("""
CREATE TABLE user (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
address TEXT )
""");
    await db.execute("""
CREATE TABLE service (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
description TEXT,
color TEXT, )
""");
  }

 
  Future<void> deleteUser({required Comparable<num> id}) async {
    await _database.delete('user', where: 'id=?', whereArgs: [id]);
  }
    Future<void> deleteService({required Comparable<num> id}) async {
    await _database.delete('service', where: 'id=?', whereArgs: [id]);
  }


 
  Future<List<UserModel>> fetchUser() async {
    return (await _database.query('user')).map((e) => UserModel.fromJson(e)).toList();
  }
   Future<List<ServiceModel>> fetchService() async {
    return (await _database.query('service')).map((e) => ServiceModel.fromJson(e)).toList();
  }
  

 
  Future<void> insertUser({required String name, String? address}) async {
    await _database.insert('user', {'name': name, 'address': address});
  }
   Future<void> insertService({required String name, String? description,String? color}) async {
    await _database.insert('service', {
      'name': name,
      'address': description,
      'color': color
        }
        );
  }
}