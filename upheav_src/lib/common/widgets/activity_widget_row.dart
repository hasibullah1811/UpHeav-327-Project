import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:upheav_src/mobx_callbacks/activity_screen_callbacks.dart';
import 'package:upheav_src/common/utils/components.dart';
import 'package:upheav_src/mobx_callbacks/splash_screen_states.dart';
import 'package:upheav_src/models/activities_model.dart';
import 'package:upheav_src/common/utils/colors.dart';
import 'package:upheav_src/common/utils/fade_animation.dart';
import 'package:upheav_src/common/utils/theme_styles.dart';

import 'button_widget.dart';
import 'custom_buttons.dart';

class ActivityWidgetRow extends StatefulWidget {
  const ActivityWidgetRow({
    Key key,
    @required ActivityScreenCallBackStore activityScreenCallBackStore,
  })  : _activityScreenCallBackStore = activityScreenCallBackStore,
        super(key: key);

  final ActivityScreenCallBackStore _activityScreenCallBackStore;

  @override
  _ActivityWidgetRowState createState() => _ActivityWidgetRowState();
}

class _ActivityWidgetRowState extends State<ActivityWidgetRow> {
  ScrollController _scroll;
  FocusNode _focus = new FocusNode();
  SplashScreenStateStore _splashScreenStateStore = SplashScreenStateStore();
  @override
  void initState() {
    // TODO: implement initState
    // _scroll = new ScrollController();
    // _focus.addListener(_focusNodeListener);
    super.initState();
  }

  @override
  void dispose() {
    // _focus.removeListener(_focusNodeListener);
    super.dispose();
  }

  // Future<Null> _focusNodeListener() async {
  //   if (_focus.hasFocus) {
  //     await _scroll.animateTo(
  //       0.0,
  //       curve: Curves.easeIn,
  //       duration: const Duration(milliseconds: 150),
  //     );
  //   } else {
  //     print('TextField lost the focus');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 280,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeAnimation(
                  0.2,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsWorkSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget
                                    ._activityScreenCallBackStore.isWorkSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color:
                              widget._activityScreenCallBackStore.isWorkSelected
                                  ? Colors.white.withAlpha(60)
                                  : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[0].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isWorkSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[0].activityName,
                              style: widget._activityScreenCallBackStore
                                      .isWorkSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  0.3,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsFamilySelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isFamilySelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget
                                  ._activityScreenCallBackStore.isFamilySelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[1].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isFamilySelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[1].activityName,
                              style: widget._activityScreenCallBackStore
                                      .isFamilySelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  0.4,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsFriendsSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isFriendsSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget._activityScreenCallBackStore
                                  .isFriendsSelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[2].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isFriendsSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[2].activityName,
                              style: widget._activityScreenCallBackStore
                                      .isFriendsSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  0.5,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsRelationshipsSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isRelationshipSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget._activityScreenCallBackStore
                                  .isRelationshipSelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[3].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isRelationshipSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[3].activityName,
                              textAlign: TextAlign.center,
                              style: widget._activityScreenCallBackStore
                                      .isRelationshipSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeAnimation(
                  0.9,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsTravellingSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isTravellingSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget._activityScreenCallBackStore
                                  .isTravellingSelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[4].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isTravellingSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[4].activityName,
                              style: widget._activityScreenCallBackStore
                                      .isTravellingSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  0.8,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateFoodSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget
                                    ._activityScreenCallBackStore.isFoodSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color:
                              widget._activityScreenCallBackStore.isFoodSelected
                                  ? Colors.white.withAlpha(60)
                                  : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[5].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isFoodSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[5].activityName,
                              style: widget._activityScreenCallBackStore
                                      .isFoodSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  0.7,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsExerciseSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isExerciseSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget._activityScreenCallBackStore
                                  .isExerciseSelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[6].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isExerciseSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[6].activityName,
                              style: widget._activityScreenCallBackStore
                                      .isExerciseSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  0.6,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsHealthSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isHealthSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget
                                  ._activityScreenCallBackStore.isHealthSelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[7].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isHealthSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[7].activityName,
                              textAlign: TextAlign.center,
                              style: widget._activityScreenCallBackStore
                                      .isHealthSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeAnimation(
                  1.0,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsHobbySelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isHobbySelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget
                                  ._activityScreenCallBackStore.isHobbySelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[8].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isHobbySelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[8].activityName,
                              style: widget._activityScreenCallBackStore
                                      .isHobbySelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  1.1,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsGamingSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isGamingSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget
                                  ._activityScreenCallBackStore.isGamingSelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[9].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isGamingSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[9].activityName,
                              style: widget._activityScreenCallBackStore
                                      .isGamingSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  1.2,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsWeatherSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isWeatherSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget._activityScreenCallBackStore
                                  .isWeatherSelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[10].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isWeatherSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[10].activityName,
                              style: widget._activityScreenCallBackStore
                                      .isWeatherSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  1.3,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsSleepSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isSleepSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget
                                  ._activityScreenCallBackStore.isSleepSelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[11].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isSleepSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[11].activityName,
                              textAlign: TextAlign.center,
                              style: widget._activityScreenCallBackStore
                                      .isSleepSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeAnimation(
                  1.7,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsShoppingSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isShoppingSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget._activityScreenCallBackStore
                                  .isShoppingSelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[12].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isShoppingSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[12].activityName,
                              style: widget._activityScreenCallBackStore
                                      .isShoppingSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  1.6,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsMusicSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isMusicSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget
                                  ._activityScreenCallBackStore.isMusicSelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[13].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isMusicSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[13].activityName,
                              style: widget._activityScreenCallBackStore
                                      .isMusicSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        widget._activityScreenCallBackStore
                            .updateIsRelaxingSelected();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isRelaxingSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget._activityScreenCallBackStore
                                  .isRelaxingSelected
                              ? Colors.white.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[14].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isRelaxingSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[14].activityName,
                              style: widget._activityScreenCallBackStore
                                      .isRelaxingSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  1.4,
                  Observer(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        // widget._activityScreenCallBackStore
                        //     .updateIsOtherSelected();
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                if (_focus.hasFocus) _focus.unfocus();
                              },
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 10.0),
                                child: AnimatedContainer(
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.grey.shade200.withOpacity(0.5),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16)),
                                  ),
                                  height: _focus.hasFocus ? height - 40 : 350,
                                  duration: Duration(seconds: 1),
                                  // Provide an optional curve to make the animation feel smoother.
                                  curve: Curves.fastOutSlowIn,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16.0,
                                              right: 16.0,
                                              top: 32,
                                              bottom: 16),
                                          child: Text(
                                            "Write your activity name",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16.0,
                                              right: 16.0,
                                              top: 8,
                                              bottom: 8),
                                          child: Container(
                                            height: 54,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 0.5,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(12),
                                              ),
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 16.0,
                                                right: 16.0,
                                              ),
                                              child: TextFormField(
                                                focusNode: _focus,
                                                // controller: _textEditingController,
                                                // onChanged: (value) {
                                                //   _updateAnimationStore
                                                //       .validateNickNameField(value);
                                                // },
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Chess',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Live Streaming',
                                                  hintStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black
                                                        .withOpacity(
                                                      0.3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16.0,
                                              right: 16.0,
                                              top: 16,
                                              bottom: 16),
                                          child: Text(
                                            "Create new activity",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        // buildOtherActivityRow(),
                                        BottomNavButtonSplash(
                                          color: Colors.purple.withOpacity(0.3),
                                          updateAnimationStore:
                                              _splashScreenStateStore,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget._activityScreenCallBackStore
                                    .isOtherSelected
                                ? Colors.white.withAlpha(60)
                                : Color(0x99FFFFFF),
                            width: .5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: widget
                                  ._activityScreenCallBackStore.isOtherSelected
                              ? Colors.black.withAlpha(60)
                              : Colors.white.withOpacity(0.6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                                return LinearGradient(
                                  colors: ThemeStyles.iconGradient,
                                ).createShader(rect);
                              },
                              child: Icon(
                                activities[15].activityIcon,
                                color: widget._activityScreenCallBackStore
                                        .isOtherSelected
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.2),
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              activities[15].activityName,
                              textAlign: TextAlign.center,
                              style: widget._activityScreenCallBackStore
                                      .isOtherSelected
                                  ? ThemeStyles.activitySelectedTextStyle
                                  : ThemeStyles.activityIdleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row buildOtherActivityRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeAnimation(
          0.9,
          Observer(
            builder: (context) => GestureDetector(
              onTap: () {
                widget._activityScreenCallBackStore
                    .updateIsTravellingSelected();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        widget._activityScreenCallBackStore.isTravellingSelected
                            ? Colors.white.withAlpha(60)
                            : Color(0x99FFFFFF),
                    width: .5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  color:
                      widget._activityScreenCallBackStore.isTravellingSelected
                          ? Colors.white.withAlpha(60)
                          : Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                        return LinearGradient(
                          colors: ThemeStyles.iconGradient,
                        ).createShader(rect);
                      },
                      child: Icon(
                        activities[4].activityIcon,
                        color: widget._activityScreenCallBackStore
                                .isTravellingSelected
                            ? Colors.white.withOpacity(0.6)
                            : Colors.black.withOpacity(0.2),
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      activities[4].activityName,
                      style: widget
                              ._activityScreenCallBackStore.isTravellingSelected
                          ? ThemeStyles.activitySelectedTextStyle
                          : ThemeStyles.activityIdleTextStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        FadeAnimation(
          0.8,
          Observer(
            builder: (context) => GestureDetector(
              onTap: () {
                widget._activityScreenCallBackStore.updateFoodSelected();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget._activityScreenCallBackStore.isFoodSelected
                        ? Colors.white.withAlpha(60)
                        : Color(0x99FFFFFF),
                    width: .5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  color: widget._activityScreenCallBackStore.isFoodSelected
                      ? Colors.white.withAlpha(60)
                      : Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                        return LinearGradient(
                          colors: ThemeStyles.iconGradient,
                        ).createShader(rect);
                      },
                      child: Icon(
                        activities[5].activityIcon,
                        color:
                            widget._activityScreenCallBackStore.isFoodSelected
                                ? Colors.white.withOpacity(0.6)
                                : Colors.black.withOpacity(0.2),
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      activities[5].activityName,
                      style: widget._activityScreenCallBackStore.isFoodSelected
                          ? ThemeStyles.activitySelectedTextStyle
                          : ThemeStyles.activityIdleTextStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        FadeAnimation(
          0.7,
          Observer(
            builder: (context) => GestureDetector(
              onTap: () {
                widget._activityScreenCallBackStore.updateIsExerciseSelected();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        widget._activityScreenCallBackStore.isExerciseSelected
                            ? Colors.white.withAlpha(60)
                            : Color(0x99FFFFFF),
                    width: .5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  color: widget._activityScreenCallBackStore.isExerciseSelected
                      ? Colors.white.withAlpha(60)
                      : Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                        return LinearGradient(
                          colors: ThemeStyles.iconGradient,
                        ).createShader(rect);
                      },
                      child: Icon(
                        activities[6].activityIcon,
                        color: widget
                                ._activityScreenCallBackStore.isExerciseSelected
                            ? Colors.white.withOpacity(0.6)
                            : Colors.black.withOpacity(0.2),
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      activities[6].activityName,
                      style:
                          widget._activityScreenCallBackStore.isExerciseSelected
                              ? ThemeStyles.activitySelectedTextStyle
                              : ThemeStyles.activityIdleTextStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        FadeAnimation(
          0.6,
          Observer(
            builder: (context) => GestureDetector(
              onTap: () {
                widget._activityScreenCallBackStore.updateIsHealthSelected();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget._activityScreenCallBackStore.isHealthSelected
                        ? Colors.white.withAlpha(60)
                        : Color(0x99FFFFFF),
                    width: .5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  color: widget._activityScreenCallBackStore.isHealthSelected
                      ? Colors.white.withAlpha(60)
                      : Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        final Rect rect = Rect.fromLTRB(0, 0, 20, 20);
                        return LinearGradient(
                          colors: ThemeStyles.iconGradient,
                        ).createShader(rect);
                      },
                      child: Icon(
                        activities[7].activityIcon,
                        color:
                            widget._activityScreenCallBackStore.isHealthSelected
                                ? Colors.white.withOpacity(0.6)
                                : Colors.black.withOpacity(0.2),
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      activities[7].activityName,
                      textAlign: TextAlign.center,
                      style:
                          widget._activityScreenCallBackStore.isHealthSelected
                              ? ThemeStyles.activitySelectedTextStyle
                              : ThemeStyles.activityIdleTextStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
