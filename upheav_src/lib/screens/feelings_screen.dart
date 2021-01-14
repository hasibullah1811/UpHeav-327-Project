import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:upheav_src/mobx_callbacks/activity_screen_callbacks.dart';
import 'package:upheav_src/mobx_callbacks/feelings_screen_callbacks.dart';
import 'package:upheav_src/common/utils/components.dart';
import 'package:upheav_src/models/activities_model.dart';
import 'package:upheav_src/models/feelings_model.dart';
import 'package:upheav_src/common/utils/theme_styles.dart';
import 'package:supercharged/supercharged.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as vector;

class FeelingsScreen extends StatefulWidget {
  @override
  _FeelingsScreenState createState() => _FeelingsScreenState();
}

class _FeelingsScreenState extends State<FeelingsScreen> {
  FeelingsScreenCallBackStore _feelingsScreenCallBackStore =
      FeelingsScreenCallBackStore();

  bool isworkSelected = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Color(0xff01d28e),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildAppBar(
                title: '',
              ),
              BuildHeaderText(
                headerText: 'And how are you feeling about all this?',
                headerTextSize: 24,
                headerAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select minimum 3 activities',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 350,
                width: 500,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Container(
                        height: 350,
                        width: 500,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 20,
                              top: 20,
                              child: InkWell(
                                onTap: () {
                                  _feelingsScreenCallBackStore
                                      .updateIsHappySelected();
                                },
                                child: Observer(
                                  builder: (context) => FadeIn(
                                    0.5,
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      height: _feelingsScreenCallBackStore
                                              .isHappySelected
                                          ? 75
                                          : 70,
                                      width: _feelingsScreenCallBackStore
                                              .isHappySelected
                                          ? 75
                                          : 70,
                                      decoration: _feelingsScreenCallBackStore
                                              .isHappySelected
                                          ? BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff363062),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff363062),
                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 3.0,
                                                ),
                                              ],
                                            )
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              //color: Color(0xffe0dede),
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.5),
                                            ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              final Rect rect =
                                                  Rect.fromLTRB(0, 0, 20, 20);
                                              return LinearGradient(
                                                colors: ThemeStyles
                                                    .feelingIconGradient,
                                              ).createShader(rect);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              child: SvgPicture.asset(
                                                feelings[0].feelingsIcon,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            feelings[0].feelingsName,
                                            style: _feelingsScreenCallBackStore
                                                    .isHappySelected
                                                ? ThemeStyles
                                                    .feelingsSelectedTextStyle
                                                : ThemeStyles
                                                    .feelingsIdleTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 55,
                              top: 120,
                              child: InkWell(
                                onTap: () {
                                  _feelingsScreenCallBackStore
                                      .updateIsBlessedSelected();
                                },
                                child: Observer(
                                  builder: (context) => FadeIn(
                                    0.6,
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      height: _feelingsScreenCallBackStore
                                              .isBlessedSelected
                                          ? 75
                                          : 70,
                                      width: _feelingsScreenCallBackStore
                                              .isBlessedSelected
                                          ? 75
                                          : 70,
                                      decoration: _feelingsScreenCallBackStore
                                              .isBlessedSelected
                                          ? BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff363062),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff363062),

                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 3.0,
                                                ),
                                              ],
                                            )
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.5),
                                            ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              final Rect rect =
                                                  Rect.fromLTRB(0, 0, 20, 20);
                                              return LinearGradient(
                                                colors:
                                                    ThemeStyles.iconGradient,
                                              ).createShader(rect);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              child: SvgPicture.asset(
                                                feelings[1].feelingsIcon,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            feelings[1].feelingsName,
                                            style: _feelingsScreenCallBackStore
                                                    .isBlessedSelected
                                                ? ThemeStyles
                                                    .feelingsSelectedTextStyle
                                                : ThemeStyles
                                                    .feelingsIdleTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 140,
                              top: 205,
                              child: InkWell(
                                onTap: () {
                                  _feelingsScreenCallBackStore
                                      .updateIsGoodSelected();
                                },
                                child: Observer(
                                  builder: (context) => FadeIn(
                                    0.7,
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      height: _feelingsScreenCallBackStore
                                              .isGoodSelected
                                          ? 90
                                          : 85,
                                      width: _feelingsScreenCallBackStore
                                              .isGoodSelected
                                          ? 90
                                          : 85,
                                      decoration: _feelingsScreenCallBackStore
                                              .isGoodSelected
                                          ? BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff363062),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff363062),

                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 3.0,
                                                ),
                                              ],
                                            )
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.5),
                                            ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              final Rect rect =
                                                  Rect.fromLTRB(0, 0, 20, 20);
                                              return LinearGradient(
                                                colors:
                                                    ThemeStyles.iconGradient,
                                              ).createShader(rect);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              child: SvgPicture.asset(
                                                feelings[2].feelingsIcon,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            feelings[2].feelingsName,
                                            style: _feelingsScreenCallBackStore
                                                    .isGoodSelected
                                                ? ThemeStyles
                                                    .feelingsSelectedTextStyle
                                                : ThemeStyles
                                                    .feelingsIdleTextStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 30,
                              top: 210,
                              child: InkWell(
                                onTap: () {
                                  _feelingsScreenCallBackStore
                                      .updateIsConfusedSelected();
                                },
                                child: Observer(
                                  builder: (context) => FadeIn(
                                    0.8,
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      height: _feelingsScreenCallBackStore
                                              .isConfusedSelected
                                          ? 95
                                          : 90,
                                      width: _feelingsScreenCallBackStore
                                              .isConfusedSelected
                                          ? 95
                                          : 90,
                                      decoration: _feelingsScreenCallBackStore
                                              .isConfusedSelected
                                          ? BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff363062),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff363062),

                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 3.0,
                                                ),
                                              ],
                                            )
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.5),
                                            ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              final Rect rect =
                                                  Rect.fromLTRB(0, 0, 20, 20);
                                              return LinearGradient(
                                                colors:
                                                    ThemeStyles.iconGradient,
                                              ).createShader(rect);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              child: SvgPicture.asset(
                                                feelings[3].feelingsIcon,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            feelings[3].feelingsName,
                                            style: _feelingsScreenCallBackStore
                                                    .isConfusedSelected
                                                ? ThemeStyles
                                                    .feelingsSelectedTextStyle
                                                : ThemeStyles
                                                    .feelingsIdleTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 120,
                              top: 20,
                              child: InkWell(
                                onTap: () {
                                  _feelingsScreenCallBackStore
                                      .updateIsBoredSelected();
                                },
                                child: Observer(
                                  builder: (context) => FadeIn(
                                    0.9,
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      height: _feelingsScreenCallBackStore
                                              .isBoredSelected
                                          ? 85
                                          : 80,
                                      width: _feelingsScreenCallBackStore
                                              .isBoredSelected
                                          ? 85
                                          : 80,
                                      decoration: _feelingsScreenCallBackStore
                                              .isBoredSelected
                                          ? BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff363062),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff363062),

                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 3.0,
                                                ),
                                              ],
                                            )
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.5),
                                            ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              final Rect rect =
                                                  Rect.fromLTRB(0, 0, 20, 20);
                                              return LinearGradient(
                                                colors:
                                                    ThemeStyles.iconGradient,
                                              ).createShader(rect);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              child: SvgPicture.asset(
                                                feelings[4].feelingsIcon,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            feelings[4].feelingsName,
                                            style: _feelingsScreenCallBackStore
                                                    .isBoredSelected
                                                ? ThemeStyles
                                                    .feelingsSelectedTextStyle
                                                : ThemeStyles
                                                    .feelingsIdleTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 170,
                              top: 100,
                              child: InkWell(
                                onTap: () {
                                  _feelingsScreenCallBackStore
                                      .updateIsAwkwardSelected();
                                },
                                child: Observer(
                                  builder: (context) => FadeIn(
                                    1,
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      height: _feelingsScreenCallBackStore
                                              .isAwkwardSelected
                                          ? 95
                                          : 90,
                                      width: _feelingsScreenCallBackStore
                                              .isAwkwardSelected
                                          ? 95
                                          : 90,
                                      decoration: _feelingsScreenCallBackStore
                                              .isAwkwardSelected
                                          ? BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff363062),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff363062),

                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 3.0,
                                                ),
                                              ],
                                            )
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.5),
                                            ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              final Rect rect =
                                                  Rect.fromLTRB(0, 0, 20, 20);
                                              return LinearGradient(
                                                colors:
                                                    ThemeStyles.iconGradient,
                                              ).createShader(rect);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              child: SvgPicture.asset(
                                                feelings[5].feelingsIcon,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            feelings[5].feelingsName,
                                            style: _feelingsScreenCallBackStore
                                                    .isAwkwardSelected
                                                ? ThemeStyles
                                                    .feelingsSelectedTextStyle
                                                : ThemeStyles
                                                    .feelingsIdleTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 250,
                              top: 200,
                              child: InkWell(
                                onTap: () {
                                  _feelingsScreenCallBackStore
                                      .updateIsAngrySelected();
                                },
                                child: Observer(
                                  builder: (context) => FadeIn(
                                    1.1,
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      height: _feelingsScreenCallBackStore
                                              .isAngrySelected
                                          ? 95
                                          : 90,
                                      width: _feelingsScreenCallBackStore
                                              .isAngrySelected
                                          ? 95
                                          : 90,
                                      decoration: _feelingsScreenCallBackStore
                                              .isAngrySelected
                                          ? BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff363062),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff363062),

                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 3.0,
                                                ),
                                              ],
                                            )
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.5),
                                            ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              final Rect rect =
                                                  Rect.fromLTRB(0, 0, 20, 20);
                                              return LinearGradient(
                                                colors:
                                                    ThemeStyles.iconGradient,
                                              ).createShader(rect);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              child: SvgPicture.asset(
                                                feelings[6].feelingsIcon,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            feelings[6].feelingsName,
                                            style: _feelingsScreenCallBackStore
                                                    .isAngrySelected
                                                ? ThemeStyles
                                                    .feelingsSelectedTextStyle
                                                : ThemeStyles
                                                    .feelingsIdleTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 250,
                              top: 25,
                              child: InkWell(
                                onTap: () {
                                  _feelingsScreenCallBackStore
                                      .updateIsAnxiousSelected();
                                },
                                child: FadeIn(
                                  1.2,
                                  Observer(
                                    builder: (context) => AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      height: _feelingsScreenCallBackStore
                                              .isAnxiousSelected
                                          ? 75
                                          : 70,
                                      width: _feelingsScreenCallBackStore
                                              .isAnxiousSelected
                                          ? 75
                                          : 70,
                                      decoration: _feelingsScreenCallBackStore
                                              .isAnxiousSelected
                                          ? BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff363062),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff363062),

                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 3.0,
                                                ),
                                              ],
                                            )
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.5),
                                            ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              final Rect rect =
                                                  Rect.fromLTRB(0, 0, 20, 20);
                                              return LinearGradient(
                                                colors:
                                                    ThemeStyles.iconGradient,
                                              ).createShader(rect);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              child: SvgPicture.asset(
                                                feelings[7].feelingsIcon,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            feelings[7].feelingsName,
                                            style: _feelingsScreenCallBackStore
                                                    .isAnxiousSelected
                                                ? ThemeStyles
                                                    .feelingsSelectedTextStyle
                                                : ThemeStyles
                                                    .feelingsIdleTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 370,
                              top: 30,
                              child: InkWell(
                                onTap: () {
                                  _feelingsScreenCallBackStore
                                      .updateIsDownSelected();
                                },
                                child: Observer(
                                  builder: (context) => FadeIn(
                                    1.3,
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      height: _feelingsScreenCallBackStore
                                              .isDownSelected
                                          ? 95
                                          : 90,
                                      width: _feelingsScreenCallBackStore
                                              .isDownSelected
                                          ? 95
                                          : 90,
                                      decoration: _feelingsScreenCallBackStore
                                              .isDownSelected
                                          ? BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff363062),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff363062),

                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 3.0,
                                                ),
                                              ],
                                            )
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.5),
                                            ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              final Rect rect =
                                                  Rect.fromLTRB(0, 0, 20, 20);
                                              return LinearGradient(
                                                colors:
                                                    ThemeStyles.iconGradient,
                                              ).createShader(rect);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              child: SvgPicture.asset(
                                                feelings[8].feelingsIcon,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            feelings[8].feelingsName,
                                            style: _feelingsScreenCallBackStore
                                                    .isDownSelected
                                                ? ThemeStyles
                                                    .feelingsSelectedTextStyle
                                                : ThemeStyles
                                                    .feelingsIdleTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 365,
                              top: 195,
                              child: InkWell(
                                onTap: () {
                                  _feelingsScreenCallBackStore
                                      .updateIsLuckySelected();
                                },
                                child: Observer(
                                  builder: (context) => FadeIn(
                                    1.3,
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      height: _feelingsScreenCallBackStore
                                              .isLuckySelected
                                          ? 95
                                          : 90,
                                      width: _feelingsScreenCallBackStore
                                              .isLuckySelected
                                          ? 95
                                          : 90,
                                      decoration: _feelingsScreenCallBackStore
                                              .isLuckySelected
                                          ? BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff363062),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff363062),

                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                            )
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.5),
                                            ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              final Rect rect =
                                                  Rect.fromLTRB(0, 0, 20, 20);
                                              return LinearGradient(
                                                colors:
                                                    ThemeStyles.iconGradient,
                                              ).createShader(rect);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              child: SvgPicture.asset(
                                                feelings[9].feelingsIcon,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            feelings[9].feelingsName,
                                            style: _feelingsScreenCallBackStore
                                                    .isLuckySelected
                                                ? ThemeStyles
                                                    .feelingsSelectedTextStyle
                                                : ThemeStyles
                                                    .feelingsIdleTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 300,
                              top: 110,
                              child: InkWell(
                                onTap: () {
                                  _feelingsScreenCallBackStore
                                      .updateIsStressedSelected();
                                },
                                child: Observer(
                                  builder: (context) => FadeIn(
                                    1.3,
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      height: _feelingsScreenCallBackStore
                                              .isStressedSelected
                                          ? 95
                                          : 90,
                                      width: _feelingsScreenCallBackStore
                                              .isStressedSelected
                                          ? 95
                                          : 90,
                                      decoration: _feelingsScreenCallBackStore
                                              .isStressedSelected
                                          ? BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff363062),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff363062),

                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 3.0,
                                                ),
                                              ],
                                            )
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.5),
                                            ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              final Rect rect =
                                                  Rect.fromLTRB(0, 0, 20, 20);
                                              return LinearGradient(
                                                colors:
                                                    ThemeStyles.iconGradient,
                                              ).createShader(rect);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              child: SvgPicture.asset(
                                                feelings[10].feelingsIcon,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            feelings[10].feelingsName,
                                            style: _feelingsScreenCallBackStore
                                                    .isStressedSelected
                                                ? ThemeStyles
                                                    .feelingsSelectedTextStyle
                                                : ThemeStyles
                                                    .feelingsIdleTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 220.0,
                  left: 16,
                  right: 16.0,
                ),
                child: Container(
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _AniProps { opacity, translateX }

class FadeIn extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeIn(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, 0.0.tweenTo(1.0))
      ..add(_AniProps.translateX, 130.0.tweenTo(0.0));

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: (300 * delay).round().milliseconds,
      duration: 500.milliseconds,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.translate(
          offset: Offset(value.get(_AniProps.translateX), 0),
          child: child,
        ),
      ),
    );
  }
}
