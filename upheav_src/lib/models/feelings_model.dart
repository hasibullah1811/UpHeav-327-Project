import 'package:upheav_src/local_database/database_creator.dart';

class FeelingsModel {
  int feelingsId;
  String feelingsName;
  String feelingsIcon;
  double feelingsScale;

  FeelingsModel({
    this.feelingsId,
    this.feelingsName,
    this.feelingsIcon,
    this.feelingsScale,
  });

  FeelingsModel.fromJson(Map<String, dynamic> json) {
    this.feelingsId = json[DatabaseCreator.feelingsId];
    this.feelingsName = json[DatabaseCreator.feelingsName];
    this.feelingsScale = json[DatabaseCreator.feelingsScale];
  }
}

final happy = FeelingsModel(
  feelingsId: 0,
  feelingsName: "Happy",
  feelingsIcon: 'assets/images/happy.svg',
  feelingsScale: 3.0,
);

final blessed = FeelingsModel(
  feelingsId: 1,
  feelingsName: "Blessed",
  feelingsIcon: 'assets/images/wink.svg',
  feelingsScale: 3.0,
);

final good = FeelingsModel(
  feelingsId: 2,
  feelingsName: "Good",
  feelingsIcon: 'assets/images/happy.svg',
  feelingsScale: 3.0,
);
final confused = FeelingsModel(
  feelingsId: 3,
  feelingsName: "Confused",
  feelingsIcon: 'assets/images/confused.svg',
  feelingsScale: 3.0,
);
final bored = FeelingsModel(
  feelingsId: 4,
  feelingsName: "Bored",
  feelingsIcon: 'assets/images/bored.svg',
  feelingsScale: 3.0,
);
final awkward = FeelingsModel(
  feelingsId: 5,
  feelingsName: "Awkward",
  feelingsIcon: 'assets/images/suspicious.svg',
  feelingsScale: 3.0,
);
final angry = FeelingsModel(
  feelingsId: 6,
  feelingsName: "Angry",
  feelingsIcon: 'assets/images/angry.svg',
  feelingsScale: 3.0,
);

final anxious = FeelingsModel(
  feelingsId: 7,
  feelingsName: "Anxious",
  feelingsIcon: 'assets/images/tongue-out.svg',
  feelingsScale: 3.0,
);
final down = FeelingsModel(
  feelingsId: 8,
  feelingsName: "Down",
  feelingsIcon: 'assets/images/unhappy.svg',
  feelingsScale: 3.0,
);
final lucky = FeelingsModel(
  feelingsId: 9,
  feelingsName: "Lucky",
  feelingsIcon: 'assets/images/ninja.svg',
  feelingsScale: 3.0,
);
final stressed = FeelingsModel(
  feelingsId: 10,
  feelingsName: "Stressed",
  feelingsIcon: 'assets/images/nerd.svg',
  feelingsScale: 3.0,
);
final feelings = [
  happy,
  blessed,
  good,
  confused,
  bored,
  awkward,
  angry,
  anxious,
  down,
  lucky,
  stressed,
];
