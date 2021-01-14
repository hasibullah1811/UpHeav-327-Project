import 'package:flutter/material.dart';
import 'package:upheav_src/common/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;
  final Function navigate;

  ButtonWidget({
    this.title,
    this.hasBorder,
    this.navigate,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: navigate,
        child: Ink(
          decoration: BoxDecoration(
            color: hasBorder ? Colors.white : ThemeColors.primaryColor,
            borderRadius: BorderRadius.circular(30),
            border: hasBorder
                ? Border.all(
                    color: ThemeColors.primaryColor,
                    width: 1.0,
                  )
                : Border.fromBorderSide(BorderSide.none),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 54.0,
              color: Colors.transparent,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: hasBorder ? ThemeColors.primaryColor : Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
