import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:upheav_src/mobx_callbacks/splash_screen_states.dart';
import 'package:upheav_src/local_database/user_service_repository.dart';
import 'package:upheav_src/models/user_model.dart';
import 'package:upheav_src/screens/home_screen.dart';
import 'package:upheav_src/common/utils/colors.dart';
import 'package:upheav_src/common/utils/custom_icons_icons.dart';
import 'package:upheav_src/common/utils/fade_animation.dart';
import 'package:upheav_src/common/utils/theme_styles.dart';
import 'package:upheav_src/common/widgets/custom_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPermissionScreen extends StatefulWidget {
  final SplashScreenStateStore updateAnimationStore;
  final String nickName;
  const NotificationPermissionScreen({
    Key key,
    this.updateAnimationStore,
    this.nickName,
  }) : super(key: key);
  @override
  _NotificationPermissionScreenState createState() =>
      _NotificationPermissionScreenState();
}

SharedPreferences localStorage;

class _NotificationPermissionScreenState
    extends State<NotificationPermissionScreen>
    with SingleTickerProviderStateMixin {
  ThemeColors themeColors = ThemeColors();
  AnimationController _controller;
  Animation _animation;

  static Future initializeSharedPreferenceStorage() async {
    localStorage = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    print('${widget.updateAnimationStore.currentNickName}');
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void createUser() async {
    int count = await UserServiceRepository.usersCount();
    final user =
        UserModel(count, widget.updateAnimationStore.currentNickName, false);
    await UserServiceRepository.addUser(user);
    print(user.id);
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: themeColors.blueGradient,
          ),
          child: Column(
            children: [
              CustomBackButton(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 40,
                  bottom: 16,
                  right: 30,
                ),
                child: FadeAnimation(
                  0.3,
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Observer(
                      builder: (context) => Text(
                          'Hello, ${widget.updateAnimationStore.currentNickName}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Ubuntu",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
              ),
              FadeAnimation(
                0.4,
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30,
                    left: 30,
                    right: 16,
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Would you like to recieve ocassional notifications from us?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              FadeTransition(
                opacity: _animation,
                child: Center(
                  child: Image.asset(
                    'assets/images/notification-permission.png',
                  ),
                ),
              ),
              FadeTransition(
                opacity: _animation,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: Container(
                      height: 54,
                      width: 130,
                      decoration: ThemeStyles.bottomNavButtonDecoration,
                      child: Center(
                        child: FlatButton(
                          onPressed: () async {
                            await saveUserNickName();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                    // nickName: widget
                                    //     .updateAnimationStore.currentNickName,
                                    ),
                              ),
                              ModalRoute.withName('/'),
                            );
                          },
                          child: Text(
                            "I'd love that",
                            style: ThemeStyles.buttonTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              FadeTransition(
                opacity: _animation,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: FlatButton(
                    onPressed: () async {
                      await saveUserNickName();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                              // nickName:
                              //     widget.updateAnimationStore.currentNickName,
                              ),
                        ),
                        ModalRoute.withName('/'),
                      );
                    },
                    child: Text('Maybe next time'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  saveUserNickName() async {
    await initializeSharedPreferenceStorage();
    localStorage.setString(
        'nickName', widget.updateAnimationStore.currentNickName);

    createUser();
  }
}
