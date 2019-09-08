

import 'package:flutter/material.dart';

enum AppTheme {
  BlueLight,
  BlueDark
}

final appThemeData = {
  AppTheme.BlueLight : ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blueGrey
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey
  )
};
