import 'package:flutter/material.dart';

class ThemeColors {
  static const primaryColor = Colors.blue;
  static const secondaryColor = Color(0xFF00A15D);
  static const kNeumorphicColor = Color.fromRGBO(235, 228, 229, 1);

  dynamic blueGradient = LinearGradient(
    colors: [
      Color.fromARGB(1, 121, 203, 202).withOpacity(0.95),
      Color.fromARGB(1, 119, 161, 211).withOpacity(0.91),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
    tileMode: TileMode.clamp,
  );

  dynamic blueGradientTwo = LinearGradient(
    colors: [
      Color.fromARGB(1, 76, 221, 242).withOpacity(0.95),
      Color.fromARGB(1, 92, 121, 255).withOpacity(0.91),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
    tileMode: TileMode.clamp,
  );
}
