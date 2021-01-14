import 'package:mobx/mobx.dart';
part 'feelings_screen_callbacks.g.dart';

// Command to Generate .g.dart file: flutter packages pub run build_runner build
class FeelingsScreenCallBackStore = FeelingsScreenCallBack
    with _$FeelingsScreenCallBackStore;

abstract class FeelingsScreenCallBack with Store {
  //bool variables
  @observable
  bool isHappySelected = false;
  @observable
  bool isBlessedSelected = false;
  @observable
  bool isGoodSelected = false;
  @observable
  bool isConfusedSelected = false;
  @observable
  bool isBoredSelected = false;
  @observable
  bool isAwkwardSelected = false;
  @observable
  bool isAngrySelected = false;
  @observable
  bool isAnxiousSelected = false;
  @observable
  bool isDownSelected = false;
  @observable
  bool isLuckySelected = false;
  @observable
  bool isStressedSelected = false;

  @observable
  int feelingsCount = 0;
  // Important actions

  @action
  updateIsHappySelected() {
    isHappySelected = !isHappySelected;
    if (isHappySelected) {
      feelingsCount++;
    } else {
      feelingsCount--;
    }
  }

  @action
  updateIsBlessedSelected() {
    isBlessedSelected = !isBlessedSelected;
    if (isBlessedSelected) {
      feelingsCount++;
    } else {
      feelingsCount--;
    }
  }

  @action
  updateIsGoodSelected() {
    isGoodSelected = !isGoodSelected;
    if (isGoodSelected) {
      feelingsCount++;
    } else {
      feelingsCount--;
    }
  }

  @action
  updateIsConfusedSelected() {
    isConfusedSelected = !isConfusedSelected;
    if (isConfusedSelected) {
      feelingsCount++;
    } else {
      feelingsCount--;
    }
  }

  @action
  updateIsBoredSelected() {
    isBoredSelected = !isBoredSelected;
    if (isBoredSelected) {
      feelingsCount++;
    } else {
      feelingsCount--;
    }
  }

  @action
  updateIsAwkwardSelected() {
    isAwkwardSelected = !isAwkwardSelected;
    if (isAwkwardSelected) {
      feelingsCount++;
    } else {
      feelingsCount--;
    }
  }

  @action
  updateIsAngrySelected() {
    isAngrySelected = !isAngrySelected;
    if (isAngrySelected) {
      feelingsCount++;
    } else {
      feelingsCount--;
    }
  }

  @action
  updateIsAnxiousSelected() {
    isAnxiousSelected = !isAnxiousSelected;
    if (isAnxiousSelected) {
      feelingsCount++;
    } else {
      feelingsCount--;
    }
  }

  @action
  updateIsDownSelected() {
    isDownSelected = !isDownSelected;
    if (isDownSelected) {
      feelingsCount++;
    } else {
      feelingsCount--;
    }
  }

  @action
  updateIsLuckySelected() {
    isLuckySelected = !isLuckySelected;
    if (isLuckySelected) {
      feelingsCount++;
    } else {
      feelingsCount--;
    }
  }

  @action
  updateIsStressedSelected() {
    isStressedSelected = !isStressedSelected;
    if (isStressedSelected) {
      feelingsCount++;
    } else {
      feelingsCount--;
    }
  }
}
