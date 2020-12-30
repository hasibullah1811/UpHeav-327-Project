import 'package:upheav_src/local_database/database_creator.dart';

class UserModel {
  int id;
  String name;

  bool isDeleted;

  UserModel(this.id, this.name, this.isDeleted);

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.name = json[DatabaseCreator.name];
    this.isDeleted = json[DatabaseCreator.isDeleted] == 1;
  }
}
