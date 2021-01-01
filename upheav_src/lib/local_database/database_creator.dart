import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DatabaseCreator {
  static const userTable = 'user';
  static const id = 'id';
  static const name = 'name';
  static const isDeleted = 'isDeleted';

  // Activity Model fromJson
  static const activityTable = 'activityTable';
  static const activityId = 'activityID';
  static const activityName = 'activityName';
  static const activityIcon = 'activityIcon';
  static const activityScale = 'activityScale';

  //Feelings Model fromJson
  static const feelingsTable = 'feelingsTable';
  static const feelingsId = 'feelingsId';
  static const feelingsName = 'feelingsName';
  static const feelingsScale = 'feelingsScale';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult,
      List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createUserTable(Database db) async {
    final userSql = '''CREATE TABLE $userTable
    (
      $id INTEGER PRIMARY KEY,
      $name TEXT,
      $isDeleted BIT NOT NULL
    )''';

    await db.execute(userSql);
  }

  Future<void> createActivityTable(Database db) async {
    final userSql = '''CREATE TABLE $activityTable
    (
      $activityId INTEGER PRIMARY KEY,
      $activityName TEXT,
      $activityScale INTEGER PRIMARY KEY,
    )''';

    await db.execute(userSql);
  }

  Future<void> createFeelingsTable(Database db) async {
    final userSql = '''CREATE TABLE $feelingsTable
    (
      $feelingsId INTEGER PRIMARY KEY,
      $feelingsName TEXT,
      $feelingsScale INTEGER PRIMARY KEY,
    )''';

    await db.execute(userSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('user_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createUserTable(db);
  }
}
