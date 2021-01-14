import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upheav_src/common/utils/custom_icons_icons.dart';
import 'package:upheav_src/common/utils/fade_animation.dart';

class BuildAppBar extends StatelessWidget {
  final String title;

  const BuildAppBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1080, height: 2160, allowFontScaling: false);
    return FadeAnimation(
      0.3,
      Padding(
        padding: EdgeInsets.fromLTRB(80.w, 80.h, 80.w, 80.h),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CustomIcons.cross,
                size: 85.h,
              ),
            ),
            SizedBox(
              width: 60.w,
            ),
            Text(
              '$title',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  final Function onTap;

  const BuildButton({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
            Positioned(
              top: 18,
              left: 155,
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildHeaderText extends StatelessWidget {
  final String headerText;
  final double headerTextSize;
  final TextAlign headerAlign;

  const BuildHeaderText({
    Key key,
    this.headerText,
    this.headerTextSize,
    this.headerAlign,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.4,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 110.w),
        child: Text(
          "$headerText",
          textAlign: headerAlign,
          style: TextStyle(
            fontSize: headerTextSize,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(
              0.3,
            ),
          ),
        ),
      ),
    );
  }
}
