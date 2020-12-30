import 'package:upheav_src/models/user_model.dart';

import 'database_creator.dart';

class UserServiceRepository {
  // returns a list of UserModels
  static Future<List<UserModel>> getAllUsers() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.userTable}
    WHERE ${DatabaseCreator.isDeleted} = 0''';
    final data = await db.rawQuery(sql);
    List<UserModel> users = List();

    for (final node in data) {
      final user = UserModel.fromJson(node);
      users.add(user);
    }
    return users;
  }

  // Returns a certain user by their ID

  static Future<UserModel> getUser(int id) async {
    //final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
    //WHERE ${DatabaseCreator.id} = $id''';
    //final data = await db.rawQuery(sql);

    final sql = '''SELECT * FROM ${DatabaseCreator.userTable}
    WHERE ${DatabaseCreator.id} = ?''';

    List<dynamic> params = [id];
    final data = await db.rawQuery(sql, params);

    final user = UserModel.fromJson(data.first);
    return user;
  }

  // Adds a new user to the user Database
  static Future<void> addUser(UserModel user) async {
    /*final sql = '''INSERT INTO ${DatabaseCreator.todoTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.name},
      ${DatabaseCreator.info},
      ${DatabaseCreator.isDeleted}
    )
    VALUES 
    (
      ${todo.id},
      "${todo.name}",
      "${todo.info}",
      ${todo.isDeleted ? 1 : 0}
    )''';*/

    final sql = '''INSERT INTO ${DatabaseCreator.userTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.name},
      ${DatabaseCreator.isDeleted}
    )
    VALUES (?,?,?)''';
    List<dynamic> params = [user.id, user.name, user.isDeleted ? 1 : 0];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add user', sql, null, result, params);
  }

  static Future<void> deleteUser(UserModel user) async {
    /*final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.isDeleted} = 1
    WHERE ${DatabaseCreator.id} = ${todo.id}
    ''';*/

    final sql = '''UPDATE ${DatabaseCreator.userTable}
    SET ${DatabaseCreator.isDeleted} = 1
    WHERE ${DatabaseCreator.id} = ?
    ''';

    List<dynamic> params = [user.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Delete user', sql, null, result, params);
  }

  static Future<void> updateTodo(UserModel user) async {
    /*final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.name} = "${todo.name}"
    WHERE ${DatabaseCreator.id} = ${todo.id}
    ''';*/

    final sql = '''UPDATE ${DatabaseCreator.userTable}
    SET ${DatabaseCreator.name} = ?
    WHERE ${DatabaseCreator.id} = ?
    ''';

    List<dynamic> params = [user.name, user.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Update user', sql, null, result, params);
  }

  static Future<int> usersCount() async {
    final data = await db
        .rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.userTable}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}
