import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upheav_src/common/utils/components.dart';

import 'package:upheav_src/common/utils/background_color_tween.dart';

import 'package:upheav_src/common/utils/fade_animation.dart';
import 'package:upheav_src/common/utils/flare_controller.dart';
import 'package:upheav_src/common/utils/mood_title_text.dart';
import 'package:upheav_src/common/utils/slider_painter.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as vector;

import 'activity_screen.dart';

enum SlideState { BAD, OK, GOOD }

class RateYourMoodScreen extends StatefulWidget {
  @override
  _RateYourMoodScreenState createState() => _RateYourMoodScreenState();
}

class _RateYourMoodScreenState extends State<RateYourMoodScreen>
    with TickerProviderStateMixin {
  FlareRateController _flareController;
  AnimationController _animationController;
  AnimationController _fadeController;
  Animation _fadeAnimation;

  double sliderWidth = 340;
  double sliderHeight = 50;

  double _dragPercent = 0.0;

  SlideState slideState = SlideState.BAD;

  void updateDragPosition(Offset offset) {
    setState(() {
      _dragPercent = (offset.dx / sliderWidth).clamp(0.0, 1.0);
      _flareController.updatePercentage(_dragPercent);

      if (_dragPercent >= 0 && _dragPercent < .3) {
        slideState = SlideState.BAD;
        _animationController.forward(from: 0.0);
      } else if (_dragPercent >= .3 && _dragPercent < .7) {
        slideState = SlideState.OK;
        _animationController.stop();
      } else if (_dragPercent > .7) {
        slideState = SlideState.GOOD;
      }
    });
  }

  void _onDragStart(BuildContext context, DragStartDetails details) {
    RenderBox box = context.findRenderObject();
    Offset localOffset = box.localToGlobal(details.globalPosition);
    updateDragPosition(localOffset);
  }

  void _onDragUpdate(BuildContext context, DragUpdateDetails details) {
    RenderBox box = context.findRenderObject();
    Offset localOffset = box.localToGlobal(details.globalPosition);
    updateDragPosition(localOffset);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _flareController = FlareRateController();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750))
          ..addListener(() => setState(() {}));

    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_fadeController);
  }

  _shake() {
    double offset = math.sin(_animationController.value * math.pi * 60);
    return vector.Vector3(
      offset * 2,
      offset * 2,
      0.0,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fadeController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fadeController.forward();
    ScreenUtil.init(context,
        width: 1080, height: 2160, allowFontScaling: false);
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      color: backgroundTween.evaluate(
        AlwaysStoppedAnimation(_dragPercent),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            //_buildAppBar(),
            BuildAppBar(
              title: "Let's write your first journal",
            ),
            _buildHeaderText(),
            SizedBox(
              height: 70.h,
            ),
            _buildTitle(),
            _buildFlareActor(),
            SizedBox(
              height: 70.h,
            ),
            _buildSlider(),
            SizedBox(
              height: 70.h,
            ),
            //
            _buildButton(),
          ],
        ),
      ),
    );
  }

  _buildButton() => InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActivityScreen(),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Stack(
            children: [
              Hero(
                tag: 'purple',
                child: Container(
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xFF848ccf),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Text(''),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget displayTitle() {
    switch (slideState) {
      case SlideState.BAD:
        return currText[0];
      case SlideState.OK:
        return currText[1];
      case SlideState.GOOD:
        return currText[2];
    }
  }

  // _buildAppBar() => FadeAnimation(
  //       0.3,
  //       Padding(
  //         padding: EdgeInsets.fromLTRB(80.w, 120.h, 80.w, 80.h),
  //         child: Row(
  //           children: [
  //             IconButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               icon: Icon(
  //                 CustomIcons.cross,
  //                 size: 85.h,
  //               ),
  //             ),
  //             SizedBox(
  //               width: 60.w,
  //             ),
  //             Text(
  //               "Let's write your first journal",
  //               style: TextStyle(
  //                 fontSize: 16,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  _buildHeaderText() => FadeAnimation(
        0.4,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 140.w),
          child: Text(
            "How was your Day?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(
                0.3,
              ),
            ),
          ),
        ),
      );

  _buildTitle() => FadeTransition(
        opacity: _fadeAnimation,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            var slideAnim =
                Tween<Offset>(begin: Offset(-2, 0), end: Offset(0, 0))
                    .animate(animation);

            return ClipRect(
              child: SlideTransition(
                position: slideAnim,
                child: child,
              ),
            );
          },
          child: displayTitle(),
        ),
      );

  _buildFlareActor() => FadeTransition(
        opacity: _fadeAnimation,
        child: Transform(
          transform: Matrix4.translation(_shake()),
          child: SizedBox(
            width: 1100.w,
            height: 680.h,
            child: FlareActor(
              'assets/flare/rate_your_day.flr',
              artboard: "Artboard",
              controller: _flareController,
            ),
          ),
        ),
      );

  _buildSlider() => FadeTransition(
        opacity: _fadeAnimation,
        child: GestureDetector(
          onHorizontalDragStart: (DragStartDetails details) =>
              _onDragStart(context, details),
          onHorizontalDragUpdate: (DragUpdateDetails details) =>
              _onDragUpdate(context, details),
          child: Container(
            height: sliderHeight,
            width: sliderWidth,
            child: CustomPaint(
              painter: SliderPainter(
                progress: _dragPercent,
              ),
            ),
          ),
        ),
      );
}
