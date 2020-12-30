import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:page_transition/page_transition.dart';
import 'package:upheav_src/mobx_callbacks/splash_screen_states.dart';

import 'package:upheav_src/common/utils/custom_icons_icons.dart';
import 'package:upheav_src/common/utils/theme_styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomNavButtonSplash extends StatelessWidget {
  const BottomNavButtonSplash({
    Key key,
    @required SplashScreenStateStore updateAnimationStore,
    @required this.color,
  })  : _updateAnimationStore = updateAnimationStore,
        super(key: key);

  final SplashScreenStateStore _updateAnimationStore;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        bottom: 6,
        right: 8.0,
      ),
      child: InkWell(
        onTap: () {
          _updateAnimationStore.updatePosition();
          Timer(Duration(milliseconds: 510), () {
            _updateAnimationStore.getNickNameField();
          });
          _updateAnimationStore.updateNavBarButton();
        },
        child: Container(
          alignment: Alignment.center,
          height: 54,
          decoration:
              ThemeStyles.bottomNavButtonDecoration.copyWith(color: color),
          child: Text(
            'Continue',
            style: ThemeStyles.buttonTextStyle,
          ),
        ),
      ),
    );
  }
}

class CustomBackButton extends StatefulWidget {
  @override
  _CustomBackButtonState createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            CustomIcons.arrow_left,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class BottomNavButtonCircle extends StatefulWidget {
  final bool buttonEnabled;
  final String nickName;
  final SplashScreenStateStore updateAnimationStore;

  const BottomNavButtonCircle({
    Key key,
    this.buttonEnabled,
    this.nickName,
    this.updateAnimationStore,
    // this.nickName,
  }) : super(key: key);
  @override
  _BottomNavButtonCircleState createState() => _BottomNavButtonCircleState();
}

class _BottomNavButtonCircleState extends State<BottomNavButtonCircle> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.updateAnimationStore.navBarButtonEnabled
            ? Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  // child: NotificationPermissionScreen(
                  //   updateAnimationStore: widget.updateAnimationStore,
                  //   nickName: widget.nickName,
                  // ),
                ),
              )
            : // Find the Scaffold in the widget tree and use it to show a SnackBar.
            //Scaffold.of(context).showSnackBar(snackBar);
            Fluttertoast.showToast(
                msg: "Name should be atleast 3 letters but not more than 12",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.redAccent,
                textColor: Colors.white,
                fontSize: 12.0,
              );
      },
      child: Observer(
        builder: (context) => Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: widget.updateAnimationStore.navBarButtonEnabled
                ? Colors.green.withOpacity(0.5)
                : Colors.blue.withOpacity(0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 54,
                width: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: Colors.blue,
                ),
                child: Icon(
                  CustomIcons.arrow_right,
                  color: Colors.white,
                  size: 18,
                )),
          ),
        ),
      ),
    );
  }
}
