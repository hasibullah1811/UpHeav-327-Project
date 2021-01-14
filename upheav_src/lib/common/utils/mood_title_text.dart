import 'package:flutter/material.dart';
import 'package:upheav_src/common/utils/theme_styles.dart';

final state = ['Terrible', 'Okay', 'Good'];

var currText = [
  Text(
    state[0],
    key: Key(state[0]),
    style: ThemeStyles.moodTitleStyle,
  ),
  Text(
    state[1],
    key: Key(state[1]),
    style: ThemeStyles.moodTitleStyle,
  ),
  Text(
    state[2],
    key: Key(state[2]),
    style: ThemeStyles.moodTitleStyle,
  ),
];
