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
}
