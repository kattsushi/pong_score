

import 'package:flutter/material.dart';

enum AppTheme {
  BlueLight,
  BlueDark
}

final appThemeData = {
  AppTheme.BlueLight : ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF3B2F81)
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF3466FF)
  )
};
