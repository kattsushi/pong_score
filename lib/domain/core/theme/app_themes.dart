

import 'package:flutter/material.dart';

enum AppTheme {
  BlueLight,
  BlueDark
}

final appThemeData = {
  AppTheme.BlueLight : ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF3B2F81),
    fontFamily: 'Orbitron'
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF3466FF),
    fontFamily: 'Orbitron'
  )
};
