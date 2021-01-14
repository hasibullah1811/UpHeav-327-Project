import 'package:mobx/mobx.dart';
part 'activity_screen_callbacks.g.dart';

// Command to Generate .g.dart file: flutter packages pub run build_runner build
class ActivityScreenCallBackStore = ActivityScreenCallBack
    with _$ActivityScreenCallBackStore;

abstract class ActivityScreenCallBack with Store {
  //bool variables
  @observable
  bool isWorkSelected = false;
  @observable
  bool isFamilySelected = false;
  @observable
  bool isFriendsSelected = false;
  @observable
  bool isSchoolSelected = false;
  @observable
  bool isRelationshipSelected = false;
  @observable
  bool isTravellingSelected = false;
  @observable
  bool isFoodSelected = false;
  @observable
  bool isExerciseSelected = false;
  @observable
  bool isHealthSelected = false;
  @observable
  bool isHobbySelected = false;
  @observable
  bool isGamingSelected = false;
  @observable
  bool isWeatherSelected = false;
  @observable
  bool isSleepSelected = false;
  @observable
  bool isShoppingSelected = false;
  @observable
  bool isMusicSelected = false;
  @observable
  bool isRelaxingSelected = false;
  @observable
  bool isOtherSelected = false;

  @observable
  int activityCount = 0;
  // Important actions

  @action
  updateIsWorkSelected() {
    isWorkSelected = !isWorkSelected;
    if (isWorkSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsFamilySelected() {
    isFamilySelected = !isFamilySelected;
    if (isFamilySelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsFriendsSelected() {
    isFriendsSelected = !isFriendsSelected;
    if (isFriendsSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsSchoolSelected() {
    isSchoolSelected = !isSchoolSelected;
    if (isSchoolSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsRelationshipsSelected() {
    isRelationshipSelected = !isRelationshipSelected;
    if (isRelationshipSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsTravellingSelected() {
    isTravellingSelected = !isTravellingSelected;
    if (isTravellingSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateFoodSelected() {
    isFoodSelected = !isFoodSelected;
    if (isFoodSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsExerciseSelected() {
    isExerciseSelected = !isExerciseSelected;
    if (isExerciseSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsHealthSelected() {
    isHealthSelected = !isHealthSelected;
    if (isHealthSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsHobbySelected() {
    isHobbySelected = !isHobbySelected;
    if (isHobbySelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsGamingSelected() {
    isGamingSelected = !isGamingSelected;
    if (isGamingSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsWeatherSelected() {
    isWeatherSelected = !isWeatherSelected;
    if (isWeatherSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsSleepSelected() {
    isSleepSelected = !isSleepSelected;
    if (isSleepSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsShoppingSelected() {
    isShoppingSelected = !isShoppingSelected;
    if (isShoppingSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsMusicSelected() {
    isMusicSelected = !isMusicSelected;
    if (isMusicSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }

  @action
  updateIsRelaxingSelected() {
    isRelaxingSelected = !isRelaxingSelected;
    if (isRelaxingSelected) {
      activityCount++;
    } else {
      activityCount--;
    }
  }
}
