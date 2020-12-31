import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:page_transition/page_transition.dart';

import 'package:upheav_src/mobx_callbacks/splash_screen_states.dart';
import 'package:upheav_src/common/utils/colors.dart';
import 'package:upheav_src/common/utils/custom_icons_icons.dart';
import 'package:upheav_src/common/utils/fade_animation.dart';
import 'package:upheav_src/common/utils/theme_styles.dart';
import 'package:upheav_src/common/widgets/custom_buttons.dart';
import 'package:upheav_src/common/widgets/text_logo.dart';

// import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  SplashScreenStateStore _updateAnimationStore = SplashScreenStateStore();
  TextEditingController _textEditingController = TextEditingController();
  ThemeColors _themeColors = ThemeColors();

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  ScrollController _scroll;
  FocusNode _focus = new FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    _scroll = new ScrollController();
    _focus.addListener(_focusNodeListener);
    super.initState();
  }

  @override
  void dispose() {
    _focus.removeListener(_focusNodeListener);
    super.dispose();
  }

  Future<Null> _focusNodeListener() async {
    if (_focus.hasFocus) {
      await _scroll.animateTo(
        0.0,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 150),
      );
    } else {
      print('TextField lost the focus');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _bottomNavFirstButton = BottomNavButtonSplash(
      updateAnimationStore: _updateAnimationStore,
      color: Colors.blue,
    );
    Widget _bottomNavSecondButton = BottomNavButtonCircle(
      updateAnimationStore: _updateAnimationStore,
      buttonEnabled: _updateAnimationStore.navBarButtonEnabled,
      nickName: _textEditingController.text,
    );
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: height,
          decoration: BoxDecoration(
            gradient: _themeColors.blueGradientTwo,
          ),
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _scroll,
            reverse: true,
            children: [
              Column(
                children: [
                  Observer(
                    builder: (context) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 70.0),
                            child: Container(
                              height: 230,
                              child: Stack(
                                children: [
                                  AnimatedPositioned(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn,
                                    left: _updateAnimationStore.flareLeft,
                                    right: _updateAnimationStore.flareRight,
                                    top: _updateAnimationStore.flareTop,
                                    bottom: _updateAnimationStore.flareBottom,
                                    child: Container(
                                        height: 200,
                                        width: 200,
                                        child: Image.asset(
                                          'assets/images/logo-light.png',
                                          height: 100,
                                          width: 100,
                                        )),
                                  ),
                                  AnimatedPositioned(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn,
                                    left: _updateAnimationStore.textLeft,
                                    right: _updateAnimationStore.textRight,
                                    top: _updateAnimationStore.textTop,
                                    bottom: _updateAnimationStore.textBottom,
                                    child: Center(
                                      child: AnimatedContainer(
                                        duration: Duration(seconds: 1),
                                        // Provide an optional curve to make the animation feel smoother.
                                        curve: Curves.fastOutSlowIn,
                                        height: 44,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: _updateAnimationStore.color
                                                  .withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          border: Border.all(
                                            color: _updateAnimationStore
                                                .borderColor,
                                            width: 0.5,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                            bottomLeft: Radius.circular(12),
                                          ),
                                          color: _updateAnimationStore.color
                                              .withOpacity(0.9),
                                        ),
                                        child: Text(
                                          'UpHeav',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            fontSize: 30,
                                            color:
                                                _updateAnimationStore.textColor,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 3,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Stack(
                    children: [
                      _updateAnimationStore.bioVisible
                          ? Observer(
                              builder: (context) {
                                return AnimatedOpacity(
                                  opacity: _updateAnimationStore.bioVisible
                                      ? 1.0
                                      : 0.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Container(
                                    height: height - 400,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 30.0,
                                        left: 8,
                                        right: 8.0,
                                      ),
                                      child: TextBio(),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Container(),
                      Observer(builder: (context) {
                        return _updateAnimationStore.showNickName
                            ? Container()
                            : FadeAnimation(
                                0.6,
                                AnimatedContainer(
                                  curve: Curves.linear,
                                  duration: Duration(
                                    milliseconds: 500,
                                  ),
                                  height: height - 400,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          top: 30.0,
                                          bottom: 0.0,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Let's start by knowing your name",
                                            style: ThemeStyles.titleTextStyle
                                                .copyWith(
                                              fontFamily: 'Ubuntu',
                                              color: Colors.white,
                                            ),
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
                                              color: ThemeColors.primaryColor,
                                              width: 0.5,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                            color: Colors.blue.withOpacity(0.1),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16.0,
                                              right: 16.0,
                                            ),
                                            child: TextFormField(
                                              focusNode: _focus,
                                              controller:
                                                  _textEditingController,
                                              onChanged: (value) {
                                                _updateAnimationStore
                                                    .validateNickNameField(
                                                        value);
                                              },
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Ubuntu',
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'eg. Hasib',
                                                hintStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue[200],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10.0,
                                          left: 8,
                                          right: 8.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    // child: LoginScreen(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                child: Text(
                                                  'I already have an account',
                                                  style: ThemeStyles
                                                      .bodyTextStyle
                                                      .copyWith(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              CustomIcons.key,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      }),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Observer(
                        builder: (context) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return ScaleTransition(
                                  child: child, scale: animation);
                            },
                            child: _updateAnimationStore.bottomNavFirstButton ==
                                    "BottomNavFirstButton"
                                ? _bottomNavFirstButton
                                : _bottomNavSecondButton,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
