import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:upheav_src/mobx_callbacks/activity_screen_callbacks.dart';

import 'package:upheav_src/common/utils/components.dart';

// import 'package:upheav_src/screens/feelings_screen.dart';
import 'package:upheav_src/common/utils/custom_icons_icons.dart';

import 'package:upheav_src/common/widgets/activity_widget_row.dart';

import 'feelings_screen.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _fadeController;
  Animation _fadeAnimation;
  bool activityEnabled = false;
  bool isWorkSelected = false;

  ActivityScreenCallBackStore _activityScreenCallBackStore =
      ActivityScreenCallBackStore();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _fadeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_fadeController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fadeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fadeController.forward();
    var size = MediaQuery.of(context).size;
    String currentDate = DateFormat('yMMMMd').format(DateTime.now());
    String currentDay = DateFormat('EEEE').format(DateTime.now());

    return Hero(
      tag: 'purple',
      child: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFF848ccf),
        ),
        child: Scaffold(
          bottomNavigationBar: Observer(
            builder: (context) => _buildButton(),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                BuildAppBar(
                  title: '',
                ),
                BuildHeaderText(
                  headerText: 'How did you spend most of your time today?',
                  headerTextSize: 24,
                  headerAlign: TextAlign.start,
                ),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 74,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 32,
                          top: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$currentDate',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '$currentDay',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Padding(
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
                ),
                ActivityWidgetRow(
                  activityScreenCallBackStore: _activityScreenCallBackStore,
                ),

                //Observer(builder: (context) => _buildButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildButton() => FadeTransition(
        opacity: _fadeAnimation,
        child: InkWell(
          onTap: () {
            _activityScreenCallBackStore.activityCount < 3
                ? Fluttertoast.showToast(
                    msg: "Select minimum 3 activities",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 12.0,
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeelingsScreen(),
                    ),
                  );
          },
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Stack(
              children: [
                Container(
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: _activityScreenCallBackStore.activityCount < 3
                        ? Colors.white.withAlpha(80)
                        : Color(0xFF363062),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Text(''),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Next (${_activityScreenCallBackStore.activityCount})',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Icon(
                        CustomIcons.chevron_right_circle,
                        size: 18,
                        color: _activityScreenCallBackStore.activityCount < 3
                            ? Colors.white
                            : Colors.green,
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
