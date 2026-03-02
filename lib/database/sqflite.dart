import 'package:flutter_andhika_1/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'pendaftaran.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
        );
        await db.execute(
          'CREATE TABLE userList (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, phoneNum TEXT, city TEXT)',
        );
      },
      version: 2,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            'CREATE TABLE userList (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, phoneNum TEXT, city TEXT)',
          );
        }
      },
    );
  }

  static Future<void> registerUser(UserModel users) async {
    final dbs = await db();
    await dbs.insert('userList', users.toMap());
  }

  static Future<List<UserModel>> getAllUser() async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query("userList");
    return results.map((e) => UserModel.fromMap(e)).toList();
  }
}
