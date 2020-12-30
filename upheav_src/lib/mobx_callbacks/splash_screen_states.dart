import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'splash_screen_states.g.dart';

// Command to Generate .g.dart file: flutter packages pub run build_runner build

class SplashScreenStateStore = SplashScreenState with _$SplashScreenStateStore;

abstract class SplashScreenState with Store {
  @observable
  String currentNickName = "";
  @observable
  bool first = true;
  @observable
  bool second = true;
  @observable
  bool showNickName = true;
  @observable
  bool bioVisible = true;
  @observable
  double flareLeft = 20.0;
  @observable
  double flareTop = 20.0;
  @observable
  double flareRight = 0.0;
  @observable
  double flareBottom = 0.0;
  @observable
  double textLeft = 20.0;
  @observable
  double textTop = 180.0;
  @observable
  double textRight = 0.0;
  @observable
  double textBottom = 0.0;
  @observable
  String bottomNavFirstButton = 'BottomNavFirstButton';

  @observable
  bool navBarButtonEnabled = false;
  @observable
  Color color = Colors.white;
  @observable
  Color textColor = Colors.black;
  @observable
  Color borderColor = Colors.white;

  @action
  updatePosition() {
    first = !first;
    second = !second;
    bioVisible = !bioVisible;

    color = Colors.blue;
    textColor = Colors.white;
    borderColor = Colors.blue;

    flareLeft = first ? 20 : 20;
    flareTop = first ? 20 : 20;
    flareRight = first ? 0 : 200;
    flareBottom = first ? 0 : 0;

    textLeft = second ? 20 : 80;
    textTop = second ? 180 : 20;
    textRight = second ? 0 : 0;
    textBottom = second ? 0 : 0;
  }

  @action
  getNickNameField() {
    showNickName = !showNickName;
  }

  @action
  updateNavBarButton() {
    bottomNavFirstButton = "BottomNavSecondButton";
  }

  @action
  validateNickNameField(String nickName) {
    if (nickName.isEmpty || nickName.length < 3 || nickName.length > 15) {
      navBarButtonEnabled = false;
    } else {
      navBarButtonEnabled = true;
      currentNickName = nickName;
    }
  }
}
