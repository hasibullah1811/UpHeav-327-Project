import 'package:flutter/material.dart';
import 'package:upheav_src/common/utils/colors.dart';

class ThemeStyles {
  static const buttonTextStyle = TextStyle(
    fontFamily: 'Ubuntu',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const bodyTextStyle = TextStyle(
    fontFamily: 'Ubuntu',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const titleTextStyle = TextStyle(
    fontFamily: 'Playfair Display',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const bottomNavButtonDecoration = BoxDecoration(
    color: ThemeColors.primaryColor,
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
  );

  static const boxShadow = BoxShadow(
    color: Colors.grey,
    offset: Offset(-5, 3),
    blurRadius: 5,
    spreadRadius: 10,
  );

  static const moodTitleStyle = TextStyle(
    fontSize: 28,
  );

  static TextStyle activitySelectedTextStyle = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle activityIdleTextStyle = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: Colors.black.withOpacity(0.2),
  );
  static TextStyle feelingsSelectedTextStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle feelingsIdleTextStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Colors.black.withOpacity(0.2),
  );
  static List<Color> iconGradient = [
    Color.fromARGB(
      1,
      34,
      126,
      34,
    ).withOpacity(1),
    Color.fromARGB(
      1,
      168,
      251,
      60,
    ).withOpacity(1),
  ]; // Green Gradient
//background-image: radial-gradient( circle 266px at 12% 29.3%,  rgba(58,219,154,0.93) 2%, rgba(153,228,208,1) 38.6%, rgba(142,246,219,0.82) 73.9%, rgba(253,255,238,1) 100.7% );
  static List<Color> feelingIconGradient = [
    Color.fromARGB(
      1,
      58,
      219,
      154,
    ).withOpacity(1),
    Color.fromARGB(
      1,
      153,
      228,
      208,
    ).withOpacity(1),
  ]; // Green Gradient

  // Neumorphic colored container with 99% app width

}
