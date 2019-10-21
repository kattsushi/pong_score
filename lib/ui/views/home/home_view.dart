import 'package:flutter/material.dart';
import 'package:pong_score/ui/layout/orientation_layout.dart';
import 'package:pong_score/ui/layout/screen_type_layout.dart';
import 'package:pong_score/ui/views/home/home_view_mobile.dart';
import 'package:pong_score/ui/views/home/home_view_tablet.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: HomeMobileViewPortrait(),
        landscape: HomeMobileLandscape(),
      ),
      tablet: HomeViewTablet(),
    );
  }
}
