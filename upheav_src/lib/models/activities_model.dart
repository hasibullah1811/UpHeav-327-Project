import 'package:upheav_src/local_database/database_creator.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upheav_src/common/utils/custom_icons_icons.dart';

class ActivityModel {
  int activityId;
  String activityName;
  IconData activityIcon;
  double activityScale;

  ActivityModel({
    this.activityId,
    this.activityName,
    this.activityIcon,
    this.activityScale,
  });

  ActivityModel.fromJson(Map<String, dynamic> json) {
    this.activityId = json[DatabaseCreator.activityId];
    this.activityName = json[DatabaseCreator.activityName];
    this.activityIcon = json[DatabaseCreator.activityIcon];
    this.activityScale = json[DatabaseCreator.activityScale];
  }
}

final work = ActivityModel(
  activityId: 0,
  activityName: "Work",
  activityIcon: CustomIcons.briefcase,
  activityScale: 3.0,
);

final family = ActivityModel(
  activityId: 1,
  activityName: "Family",
  activityIcon: CustomIcons.users,
  activityScale: 3.0,
);
final school = ActivityModel(
  activityId: 2,
  activityName: "Friends",
  activityIcon: Icons.insert_emoticon,
  activityScale: 3.0,
);
final relationships = ActivityModel(
  activityId: 3,
  activityName: "Relationship",
  activityIcon: CustomIcons.heart_1,
  activityScale: 3.0,
);

final travelling = ActivityModel(
  activityId: 4,
  activityName: "Travelling",
  activityIcon: CustomIcons.train,
  activityScale: 3.0,
);

final food = ActivityModel(
  activityId: 5,
  activityName: "Food",
  activityIcon: CustomIcons.food,
  activityScale: 3.0,
);
final exercise = ActivityModel(
  activityId: 6,
  activityName: "Exercise",
  activityIcon: Icons.transfer_within_a_station,
  activityScale: 3.0,
);
final health = ActivityModel(
  activityId: 7,
  activityName: "Health",
  activityIcon: CustomIcons.heart_pulse,
  activityScale: 3.0,
);
final hobby = ActivityModel(
  activityId: 8,
  activityName: "Hobby",
  activityIcon: CustomIcons.code,
  activityScale: 3.0,
);

final games = ActivityModel(
  activityId: 9,
  activityName: "Games",
  activityIcon: Icons.games,
  activityScale: 3.0,
);
final weather = ActivityModel(
  activityId: 10,
  activityName: "Weather",
  activityIcon: CustomIcons.sun,
  activityScale: 3.0,
);

final sleep = ActivityModel(
  activityId: 11,
  activityName: "Sleep",
  activityIcon: CustomIcons.moon,
  activityScale: 3.0,
);
final shopping = ActivityModel(
  activityId: 12,
  activityName: "Shopping",
  activityIcon: Icons.shopping_cart,
  activityScale: 3.0,
);
final music = ActivityModel(
  activityId: 12,
  activityName: "Music",
  activityIcon: CustomIcons.music,
  activityScale: 3.0,
);
final chilled = ActivityModel(
  activityId: 13,
  activityName: "Chilled",
  activityIcon: Icons.weekend,
  activityScale: 3.0,
);
final others = ActivityModel(
  activityId: 14,
  activityName: "Others",
  activityIcon: CustomIcons.plus_circle,
  activityScale: 3.0,
);
final activities = [
  work,
  family,
  school,
  relationships,
  travelling,
  food,
  exercise,
  health,
  hobby,
  games,
  weather,
  sleep,
  shopping,
  music,
  chilled,
  others,
];
